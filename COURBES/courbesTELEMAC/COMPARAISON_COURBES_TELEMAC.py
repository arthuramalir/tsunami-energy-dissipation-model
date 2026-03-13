# -*- coding: utf-8 -*-
"""
Created on Sat Mar 22 14:03:36 2025

@author: ARTHUR AMALIR
"""

import numpy as np
import matplotlib.pyplot as plt

# Load the data
data = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\courbesTELEMAC\\EDFpoupardin-confinf-WATER DEPTH (4 series).txt')

time = np.linspace(0, 9, len(data[:, 0]))  # Create an array from 0 to 9 seconds with the same length as your data

# Plot the data
plt.plot(time,data[:, 0], label='C2 telemac')
#plt.plot(time,data[:, 1], label='C3 telemac')
#plt.plot(time,data[:, 2], label='C4 telemac')
#plt.plot(time,data[:, 3], label='C6 telemac')
plt.xlabel('t')
plt.ylabel('Y(m)')
plt.title('WATER DEPTH vs t')
plt.legend()
plt.show()

