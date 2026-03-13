# -*- coding: utf-8 -*-
"""
Created on Tue Mar 18 18:09:01 2025

@author: ARTHUR AMALIR
"""
import numpy as np
import matplotlib.pyplot as plt

data1 = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\courbesMATLAB\\C2_cas_9cyl.txt')
#data2 = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\courbesMATLAB\\C3_cas_9cyl.txt')
#data3 = np.loadtxt('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\courbesMATLAB\\C3_cas_16cyl.txt')


plt.plot(data1[:, 0], data1[:, 1], label='C2 9cyl MATLAB')
#plt.plot(data2[:, 0], data2[:, 1], label='C3_cas_9cyl')
#plt.plot(data3[:, 0], data3[:, 1], label='C3_cas_16cyl')
plt.xlabel('t')
plt.ylabel('Y(m)')
plt.title('WATER DEPTH(t)')
plt.legend()
plt.show()
