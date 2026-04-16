# -*- coding: utf-8 -*-
"""
Rare-Event Analysis of Tsunami Run-Up with and without Natural Barriers
========================================================================

Methodology
-----------
1. Load the deterministic MATLAB shallow-water simulation outputs for three
   barrier configurations: 0, 9, and 16 cylinders.
2. Build a Monte Carlo ensemble by scaling the nominal run-up time series
   with a random wave-height multiplier that represents uncertainty in the
   offshore wave amplitude (Log-Normal distribution, median = nominal
   deltahe = 0.10 m, sigma_log = 0.50, i.e. CV ≈ 53 %).  This linear
   scaling is consistent with shallow-water theory where transmitted wave
   height is proportional to the incident amplitude.
3. Fit a Generalised Extreme Value (GEV) distribution to the ensemble of
   peak run-up depths for each configuration (scipy.stats.genextreme).
4. Compute and plot return levels (10 / 100 / 1000-year equivalents) and
   exceedance-probability curves for each configuration.
5. Report the probabilistic reduction in extreme run-up (Value-at-Risk and
   Conditional Value-at-Risk) induced by the natural barriers.

Outputs (saved in COURBES/)
----------------------------
  rare_event_nominal_timeseries.png – Nominal deterministic time series for C6
  rare_event_exceedance.png         – Exceedance probability curves + GEV fits
  rare_event_return_levels.png      – Return-level plots for the three configs
  rare_event_summary.txt            – Key statistics table

Usage
-----
  python rare_event_analysis.py

@author: Arthur AMALIR – ESTP Cachan, Master's Thesis 2024-2025
"""

import os
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import genextreme, lognorm

# ---------------------------------------------------------------------------
# 0. Paths
# ---------------------------------------------------------------------------
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
CURVES_DIR = os.path.join(SCRIPT_DIR, "COURBES", "courbesMATLAB")
OUT_DIR    = os.path.join(SCRIPT_DIR, "COURBES")

# ---------------------------------------------------------------------------
# 1. Load nominal simulation results
#    Each file: column 0 = time [s], column 1 = water depth [cm]
#    Sensor C6 is the most downstream gauge (run-up proxy); available for
#    all three configurations.
# ---------------------------------------------------------------------------
CONFIGS = {
    "0 cyl":  "C6_cas_0cyl.txt",
    "9 cyl":  "C6_cas_9cyl.txt",
    "16 cyl": "C6_cas_16cyl.txt",
}

nominal_peaks = {}   # config name -> peak water depth [cm] from nominal run
time_series   = {}   # config name -> (time, depth) arrays

for label, fname in CONFIGS.items():
    fpath = os.path.join(CURVES_DIR, fname)
    data  = np.loadtxt(fpath)
    t     = data[:, 0]
    h     = data[:, 1]
    time_series[label]   = (t, h)
    nominal_peaks[label] = float(np.max(h))

print("Nominal peak water depths (cm):")
for lbl, pk in nominal_peaks.items():
    print(f"  {lbl:>7s}: {pk:.4f} cm")

# ---------------------------------------------------------------------------
# 2. Monte Carlo ensemble
#    Sample N offshore wave-height multipliers M ~ LogNormal(0, sigma_log)
#    → the median multiplier is 1 (nominal), tails cover rare large events.
#    Peak run-up for each realisation i:  peak_i = peak_nominal × M_i
# ---------------------------------------------------------------------------
N_SAMPLES  = 50_000          # number of Monte Carlo realisations
SIGMA_LOG  = 0.50            # log-std of offshore wave-height multiplier

# Multipliers: median=1, but fat upper tail to represent extreme tsunamis
M = lognorm.rvs(s=SIGMA_LOG, scale=1.0, size=N_SAMPLES, random_state=42)

ensemble_peaks = {}
for label, pk_nom in nominal_peaks.items():
    ensemble_peaks[label] = pk_nom * M   # shape (N_SAMPLES,)

# ---------------------------------------------------------------------------
# 3. GEV fitting
# ---------------------------------------------------------------------------
gev_params = {}   # label -> (c, loc, scale)  (c = shape ξ in scipy sign)
for label, peaks in ensemble_peaks.items():
    c, loc, scale = genextreme.fit(peaks, method="MLE")
    gev_params[label] = (c, loc, scale)
    print(f"\nGEV fit – {label}:  ξ={-c:.4f}  μ={loc:.4f}  σ={scale:.4f}")

# ---------------------------------------------------------------------------
# 4. Exceedance probability curves  P(H > h)
# ---------------------------------------------------------------------------
COLORS = {"0 cyl": "#d62728", "9 cyl": "#ff7f0e", "16 cyl": "#2ca02c"}

fig1, ax1 = plt.subplots(figsize=(9, 6))

h_range = np.linspace(0.01, max(p.max() for p in ensemble_peaks.values()) * 1.05, 500)

for label, (c, loc, scale) in gev_params.items():
    # GEV survival function  P(H > h)
    exceedance = genextreme.sf(h_range, c, loc=loc, scale=scale)
    ax1.semilogy(h_range, exceedance, color=COLORS[label],
                 linewidth=2, label=f"GEV fit – {label}")

    # Empirical exceedance (sorted peaks)
    pk_sorted  = np.sort(ensemble_peaks[label])
    emp_exceed = 1.0 - np.arange(1, N_SAMPLES + 1) / (N_SAMPLES + 1)
    ax1.semilogy(pk_sorted[::250], emp_exceed[::250], ".",
                 color=COLORS[label], markersize=3, alpha=0.4)

ax1.set_xlabel("Peak water depth at C6 (cm)", fontsize=12)
ax1.set_ylabel("Exceedance probability  P(H > h)", fontsize=12)
ax1.set_title("Tsunami run-up exceedance probability\n"
              "Monte Carlo ensemble (N = {:,}) + GEV fit".format(N_SAMPLES), fontsize=13)
ax1.legend(fontsize=11)
ax1.grid(True, which="both", alpha=0.3)
ax1.set_xlim(left=0)
fig1.tight_layout()
fig1.savefig(os.path.join(OUT_DIR, "rare_event_exceedance.png"), dpi=150)
print("\nSaved: rare_event_exceedance.png")

# ---------------------------------------------------------------------------
# 5. Return-level plot
#    Return period T_r [years] assumed: 1 model run ≡ 1 event.
#    P(exceedance per event) = 1 / T_r
# ---------------------------------------------------------------------------
RETURN_PERIODS = np.logspace(0, 4, 200)   # 1 to 10 000 events
fig2, ax2 = plt.subplots(figsize=(9, 6))

return_levels = {}
for label, (c, loc, scale) in gev_params.items():
    # GEV return level: h such that P(H > h) = 1/T_r
    rl = genextreme.isf(1.0 / RETURN_PERIODS, c, loc=loc, scale=scale)
    return_levels[label] = rl
    ax2.semilogx(RETURN_PERIODS, rl, color=COLORS[label],
                 linewidth=2, label=label)

ax2.set_xlabel("Return period (number of events)", fontsize=12)
ax2.set_ylabel("Return-level: peak water depth at C6 (cm)", fontsize=12)
ax2.set_title("Tsunami run-up return levels\nfor three barrier configurations", fontsize=13)
ax2.legend(fontsize=11)
ax2.grid(True, which="both", alpha=0.3)

# Mark 100- and 1000-event return levels
for T_mark, lstr in [(100, "100-event"), (1000, "1000-event")]:
    ax2.axvline(T_mark, color="grey", linestyle="--", linewidth=1, alpha=0.7)
    y_min = ax2.get_ylim()[0]
    # small offsets: 5% right of the marker line, just above the bottom axis
    ax2.text(T_mark * 1.05, y_min + 0.02 * (ax2.get_ylim()[1] - y_min),
             lstr, fontsize=9, color="grey", rotation=90, va="bottom")

fig2.tight_layout()
fig2.savefig(os.path.join(OUT_DIR, "rare_event_return_levels.png"), dpi=150)
print("Saved: rare_event_return_levels.png")

# ---------------------------------------------------------------------------
# 6. Value-at-Risk (VaR) and Conditional Value-at-Risk (CVaR / Expected
#    Shortfall) at confidence levels α = 0.95, 0.99, 0.999
#    VaR_α  = h such that P(H ≤ h) = α
#    CVaR_α = E[H | H > VaR_α]
# ---------------------------------------------------------------------------
ALPHAS = [0.95, 0.99, 0.999]

def alpha_str(a):
    """Format confidence level, e.g. 0.999 -> '99.9%', 0.95 -> '95%'."""
    pct = a * 100
    return f"{pct:.1f}%" if pct != int(pct) else f"{int(pct)}%"

summary_lines = []
summary_lines.append(
    "Rare-Event Analysis Summary – Tsunami Run-Up (sensor C6)\n"
    "=========================================================\n"
)
summary_lines.append(f"Monte Carlo samples : {N_SAMPLES:,}\n")
summary_lines.append(f"Wave-height multiplier : LogNormal(median=1, σ_log={SIGMA_LOG})\n\n")
summary_lines.append(f"{'Config':>8s}  {'Nominal pk (cm)':>16s}  "
                     + "  ".join(f"VaR {alpha_str(a)} (cm)  CVaR {alpha_str(a)} (cm)"
                                 for a in ALPHAS) + "\n")
summary_lines.append("-" * 130 + "\n")

print("\n--- Value-at-Risk / CVaR ---")
print(f"{'Config':>8s}  {'Nom. peak':>10s}", end="")
for a in ALPHAS:
    print(f"   VaR {alpha_str(a)}   CVaR {alpha_str(a)}", end="")
print()

var_table  = {}
cvar_table = {}
for label, peaks in ensemble_peaks.items():
    var_row  = []
    cvar_row = []
    for a in ALPHAS:
        var_val  = float(np.quantile(peaks, a))
        cvar_val = float(peaks[peaks >= var_val].mean())
        var_row.append(var_val)
        cvar_row.append(cvar_val)
    var_table[label]  = var_row
    cvar_table[label] = cvar_row

    row_str = f"{label:>8s}  {nominal_peaks[label]:>10.4f}"
    for var_val, cvar_val in zip(var_row, cvar_row):
        row_str += f"   {var_val:>8.4f}   {cvar_val:>9.4f}"
    print(row_str)
    summary_lines.append(row_str + "\n")

# Barrier reduction at VaR/CVaR
summary_lines.append("\nBarrier reduction relative to 0-cyl baseline:\n")
summary_lines.append(f"{'Metric':>30s}  {'9 cyl reduction':>18s}  {'16 cyl reduction':>18s}\n")
summary_lines.append("-" * 70 + "\n")
print("\n--- Barrier reduction vs. 0-cyl baseline ---")

for i, a in enumerate(ALPHAS):
    for metric, table in [("VaR", var_table), ("CVaR", cvar_table)]:
        base  = table["0 cyl"][i]
        r9    = 100.0 * (base - table["9 cyl"][i])  / base
        r16   = 100.0 * (base - table["16 cyl"][i]) / base
        row   = f"  {metric} α={alpha_str(a)}: base={base:.4f} cm  9cyl={r9:+.1f}%  16cyl={r16:+.1f}%"
        print(row)
        summary_lines.append(
            f"{metric} α={alpha_str(a)}{' ':>20s}  {r9:>+16.1f}%  {r16:>+16.1f}%\n"
        )

# ---------------------------------------------------------------------------
# 7. Nominal time-series comparison plot (context for the analysis)
# ---------------------------------------------------------------------------
fig3, ax3 = plt.subplots(figsize=(10, 5))
for label, (t, h) in time_series.items():
    ax3.plot(t, h, color=COLORS[label], linewidth=1.8, label=label)
ax3.set_xlabel("Time (s)", fontsize=12)
ax3.set_ylabel("Water depth at C6 (cm)", fontsize=12)
ax3.set_title("Nominal deterministic runs – sensor C6\n"
              "(basis for rare-event Monte Carlo scaling)", fontsize=13)
ax3.legend(fontsize=11)
ax3.grid(alpha=0.3)
fig3.tight_layout()
fig3.savefig(os.path.join(OUT_DIR, "rare_event_nominal_timeseries.png"), dpi=150)
print("Saved: rare_event_nominal_timeseries.png")

# ---------------------------------------------------------------------------
# 8. Write summary text file
# ---------------------------------------------------------------------------
summary_path = os.path.join(OUT_DIR, "rare_event_summary.txt")
with open(summary_path, "w", encoding="utf-8") as fh:
    fh.writelines(summary_lines)
print(f"Saved: rare_event_summary.txt\n")

plt.show()
