# -*- coding: utf-8 -*-
"""
Created on Tue Apr  8 15:50:19 2025

@author: ARTHUR AMALIR
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

# ------------------------ DATA LOADING ------------------------
# Load MATLAB data
data_matlab = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesMATLAB\\C2_cas_9cyl.txt')
time_matlab = data_matlab[:, 0]  # First column is time
depth_matlab = data_matlab[:, 1]  # Second column is depth

# Load TELEMAC data
data_telemac = pd.read_csv(
    'C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\courbesTELEMAC\\1.EDFpoupardin-keps\\MAILLAGE INITIAL -  STRICKLER- COEF=85\\WATER DEPTH (4 series).csv',
    sep=",",
    skiprows=1
)
data_telemac.columns = ["date", "Value_1", "Value_2", "Value_3", "Value_4"]
data_telemac = data_telemac.apply(pd.to_numeric, errors="coerce")
depth_telemac = 100 * data_telemac["Value_1"].dropna().to_numpy()

# Load Experimental data
data_exp_c2 = pd.read_excel(
    'C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx',
    sheet_name="C2"
)
depth_exp = pd.to_numeric(data_exp_c2.iloc[2:, 1], errors="coerce").dropna().to_numpy()

# ------------------------ TIME PROCESSING ------------------------
common_time = np.linspace(0, 9, len(depth_matlab))  # MATLAB-based time scale
time_telemac = np.linspace(0, 9, len(depth_telemac))

# Experimental time scaling (NO HORIZONTAL SHIFT)
scale_factor = 4.1  # Adjust this value as needed
time_exp = np.linspace(0, 9 * scale_factor, len(depth_exp))

# Create interpolation functions
interp_telemac = interp1d(time_telemac, depth_telemac, kind="linear", fill_value="extrapolate")
interp_exp = interp1d(time_exp, depth_exp, kind="linear", fill_value="extrapolate")

# Interpolate to common time
depth_telemac_interp = interp_telemac(common_time)
depth_exp_interp = interp_exp(common_time)

# ------------------------ PLOTTING ------------------------
shift_telemac=1.7
shift_exp=3.15
plt.figure(figsize=(15, 7))
plt.plot(common_time, depth_matlab, label="C2 MATLAB", linewidth=2)
plt.plot(common_time-shift_telemac, depth_telemac_interp, label="C2 Telemac", linestyle="--", color="red")
plt.plot(common_time-shift_exp, depth_exp_interp, label="C2 Experimental (Stretched)", color="orange")

# Axis configuration
plt.xlim(-2, 9)  # Force full x-axis range
plt.xlabel("Time (s)", fontsize=12)
plt.ylabel("Water Depth (cm)", fontsize=12)
plt.title("WATER DEPTH vs Time", fontsize=14)
plt.grid(alpha=0.3)
plt.legend()
plt.tight_layout()
plt.show()

# ------------------------ DATA VERIFICATION ------------------------
print("\nData Ranges:")
print(f"MATLAB Min/Max: {depth_matlab.min():.3f} / {depth_matlab.max():.3f}")
print(f"Experimental Min/Max: {depth_exp_interp.min():.3f} / {depth_exp_interp.max():.3f}")
print(f"Telemac Min/Max: {depth_telemac_interp.min():.3f} / {depth_telemac_interp.max():.3f}")