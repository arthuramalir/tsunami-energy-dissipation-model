import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

###DATAS
# Load MATLAB data

data_matlab = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesMATLAB\\C2_cas_9cyl.txt')
time_matlab = data_matlab[:, 0]  # First column is time
depth_matlab = data_matlab[:, 1]  # Second column is depth

# Load TELEMAC data (skip first row with metadata)
data_telemac = pd.read_csv('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\courbesTELEMAC\\1.EDFpoupardin-keps\\MAILLAGE INITIAL -  STRICKLER- COEF=85\\WATER DEPTH (4 series).csv', sep=",", skiprows=1)

# Rename columns for easier access
data_telemac.columns = ["date", "Value_1", "Value_2", "Value_3", "Value_4"]

# Convert relevant columns to numeric
data_telemac = data_telemac.apply(pd.to_numeric, errors="coerce")

# Extract the first water depth series (assuming it corresponds to C2)
depth_telemac = 100*data_telemac["Value_1"].dropna().to_numpy()

# Load Experimental data from the "C2" sheet of the Excel file
data_exp_c2 = pd.read_excel('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx', sheet_name="C2")

# Extract the water depth values for C2 (ignoring the first two rows)
depth_exp = pd.to_numeric(data_exp_c2.iloc[2:, 1], errors="coerce").dropna().to_numpy()





###TEMPS
# Use the longest dataset (MATLAB) as the common time scale
common_time = np.linspace(0, 9, len(depth_matlab))

# Create time scales for each dataset based on their original lengths
time_telemac = np.linspace(0, 9, len(depth_telemac))



#--------------------------------------------------------------
# NEW: Stretch experimental time axis with a scaling factor
#--------------------------------------------------------------
scale_factor = 4.1  # >1 stretches, <1 compresses. Adjust this value!
time_exp = np.linspace(0, 9 * scale_factor, len(depth_exp))  # Scaled time axis

# Create linear interpolation functions
interp_telemac = interp1d(time_telemac, depth_telemac, kind="linear", fill_value="extrapolate")
interp_exp = interp1d(time_exp, depth_exp, kind="linear", fill_value="extrapolate")  # Now uses scaled time

# Generate interpolated values
depth_telemac_interp = interp_telemac(common_time)
depth_exp_interp = interp_exp(common_time)  # Now stretched to match 9s



###PLOT

plt.plot(common_time, depth_telemac_interp, label="C2 Telemac")

plt.figure(figsize=(15, 7))
plt.plot(common_time, depth_matlab, label="C2 MATLAB")

shift_amount_telemac=1.6
shift_amount_exp=3.2

plt.plot(common_time - shift_amount_exp, depth_exp_interp, label="C2 Experimental (Stretched)")  # Optional vertical shift
plt.plot(common_time - shift_amount_telemac, depth_telemac_interp, label="C2 Telemac")

#shift_amount = .2  # Adjust this value as needed
#plt.plot(common_time - shift_amount, depth_exp_interp, label="C2 Experimental (Shifted)")



plt.xlabel("Time (s)")
plt.ylabel("Water Depth (cm)")
plt.title("WATER DEPTH vs Time")
plt.legend()
plt.show()







#VERIFICIATIONS
print("MATLAB Min/Max:", depth_matlab.min(), depth_matlab.max())
print("Experimental Min/Max:", depth_exp_interp.min(), depth_exp_interp.max())
print("Telemac Min/Max:", depth_telemac_interp.min(), depth_telemac_interp.max())




"""
pour TELEMAC:
TIME STEP                       = 0.0018
NUMBER OF TIME STEPS            = 5000

pour MATLAB:
T=9;%2;%2000*dt;                                                      %La durée de l'expérience (10 s)
t=0:dt:T;                                                   %Construction d'une liste de temps t de 0 à T avec un pas dt
[r,s]=size(t);                                              %permet d'obtenir s, la taille de la liste des temps t, utile pour la suite
dtout=0.2;
tout=0:dtout:T;
[rr,ss]=size(tout);
"""