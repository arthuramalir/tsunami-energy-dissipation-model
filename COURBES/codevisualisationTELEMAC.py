# -*- coding: utf-8 -*-
"""
Created on Tue Mar 18 18:03:07 2025

@author: ARTHUR AMALIR
"""
import numpy as np
import matplotlib.pyplot as plt

# Load the data
data = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\ESSAI 1 - k eps -WATER DEPTH (4 series) - Copy.txt')

# Plot the data
plt.plot(data[:, 0], label='C2 telemac')
plt.plot(data[:, 1], label='C3 telemac')
plt.plot(data[:, 2], label='C4 telemac')
plt.plot(data[:, 3], label='C6 telemac')
plt.xlabel('t')
plt.ylabel('Y(m)')
plt.title('WATER DEPTH(x)')
plt.legend()
plt.show()

