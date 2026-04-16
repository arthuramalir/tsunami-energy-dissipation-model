# tsunami-energy-dissipation-model

Numerical modeling project on tsunami energy dissipation through cylinder arrays (TELEMAC + MATLAB + Python analysis scripts).

This repository is intentionally kept close to the original project layout (light cleanup only).

## What is inside

- `CODE/`: simulation setup files, mesh/cylinder geometry, TELEMAC case files, and Fortran condition files.
- `COURBES/`: post-processing and curve comparison scripts/data (experimental, MATLAB, and TELEMAC outputs).
- Root-level scripts and data: bathymetry generation, coordinate files, helper scripts, and source datasets.

## Main technologies

- TELEMAC case/input files (`.cas`, `.i2s`, `.tb0`)
- MATLAB scripts (`.m`)
- Python analysis/plotting scripts (`.py`)
- Fortran boundary/initial condition routines (`.f`)

## Quick start

1. Clone the repository.
2. Open the project in VS Code.
3. Run Python post-processing scripts from `COURBES/` as needed.
4. Use TELEMAC/MATLAB files from `CODE/` for simulation and scenario setup.

## Rare-Event Analysis

`rare_event_analysis.py` (root level) implements the probabilistic extension of the deterministic model:

1. **Peak extraction** – reads the nominal sensor-C6 time series for each barrier configuration (0 / 9 / 16 cylinders) from `COURBES/courbesMATLAB/`.
2. **Monte Carlo ensemble** – generates 50 000 realisations by scaling the nominal run-up with a Log-Normal wave-height multiplier (σ_log = 0.50, median = 1), representing uncertainty in the offshore wave amplitude.
3. **GEV fitting** – fits a Generalised Extreme Value distribution to the ensemble of peak run-up depths for each configuration.
4. **Return-level & exceedance curves** – plots saved to `COURBES/` (`rare_event_exceedance.png`, `rare_event_return_levels.png`, `rare_event_nominal_timeseries.png`).
5. **VaR / CVaR table** – Value-at-Risk and Conditional Value-at-Risk at α = 95 %, 99 %, 99.9 % are printed and saved to `COURBES/rare_event_summary.txt`.

Run with:
```bash
python rare_event_analysis.py
```

Key result: natural barriers (9–16 cylinders) reduce extreme run-up (VaR₉₉ / CVaR₉₉) by **~37–40 %** across all confidence levels, consistent with the deterministic validation.

## Notes

- Many files are research artifacts and intermediate outputs.
- Heavy archives and office/PDF deliverables are excluded from Git tracking to keep the repository pushable.
