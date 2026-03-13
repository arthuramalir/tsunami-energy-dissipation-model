# -*- coding: utf-8 -*-
"""
Created on Wed Mar 12 19:29:28 2025

@author: ARTHUR AMALIR
"""

import pandas as pd
import pvlib
import matplotlib.pyplot as plt

# Coordonnées pour Marseille
latitude, longitude = 43.2965, 5.3698

# Période de simulation : une journée entière avec un pas horaire
times = pd.date_range('2024-06-21 00:00', '2024-06-21 23:00', freq='1H', tz='Europe/Paris')

# Création d'un objet Location
site = pvlib.location.Location(latitude, longitude, 'Europe/Paris')

# Calcul de la position du soleil
solar_position = site.get_solarposition(times)

# Données météorologiques hypothétiques
dni = 800  # Irradiance directe normale en W/m²
ghi = 1000  # Irradiance horizontale globale en W/m²
dhi = 200  # Irradiance horizontale diffuse en W/m²

# Paramètres du panneau solaire
surface_tilt = 30  # Inclinaison de la surface en degrés
surface_azimuth = 180  # Azimut de la surface (180° = plein sud)

# Calcul de l'irradiance sur le plan du panneau
poa_irrad = pvlib.irradiance.get_total_irradiance(
    surface_tilt,
    surface_azimuth,
    solar_position['zenith'],
    solar_position['azimuth'],
    dni=dni,
    ghi=ghi,
    dhi=dhi
)

# Affichage des résultats
plt.figure(figsize=(10, 6))
plt.plot(times, poa_irrad['poa_global'], label='Irradiance sur le plan du panneau')
plt.xlabel('Heure')
plt.ylabel('Irradiance (W/m²)')
plt.title('Simulation de l\'irradiance sur un panneau photovoltaïque à Marseille')
plt.legend()
plt.grid(True)
plt.show()
