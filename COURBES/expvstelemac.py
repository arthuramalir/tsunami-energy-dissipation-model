import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os
from scipy.interpolate import interp1d

# === CONFIGURATION GÉNÉRALE ===
folder_path = r'C:\V8P4\examples\telemac2d\programmeEDFpoupardin\tests avec differnets modeles de turbulence'
exp_file_path = r'C:\Users\ARTHUR AMALIR\OneDrive\Documents\2A\projet recherche\COURBES\CourbesEXPERIMENTALES\essai9cyl.xlsx'
sheet_name = "C2"  # Capteur C2 uniquement

time_step = 0.1
target_sensor = 2  # Capteur C2 (index 1 en 1-based, donc 1 en 0-based)
scale_factor = 4.1
shift_telemac = 3
shift_exp = 3
xlim_range = (-2, 9)

# === CHARGEMENT DES DONNÉES TELEMAC ===
csv_files = [f for f in os.listdir(folder_path) if f.endswith('.csv')]
telemac_data = {}

for file in csv_files:
    try:
        path = os.path.join(folder_path, file)
        df = pd.read_csv(path, skiprows=[0, 1])
        df_numeric = df.iloc[:, 1:].apply(pd.to_numeric, errors='coerce')

        model_name = file.replace('.csv', '')
        time_array = np.arange(len(df_numeric)) * time_step
        values = df_numeric.iloc[:, target_sensor - 1].values  # index 0-based

        telemac_data[model_name] = {
            'time': time_array,
            'values': values
        }

    except Exception as e:
        print(f"Erreur lors du traitement de {file} : {e}")

# === CHARGEMENT DES DONNÉES EXPÉRIMENTALES ===
data_exp = pd.read_excel(exp_file_path, sheet_name=sheet_name)
depth_exp = pd.to_numeric(data_exp.iloc[2:, 1], errors='coerce').dropna().to_numpy()
time_exp = np.linspace(0, 9 * scale_factor, len(depth_exp))

# === ALIGNEMENT TEMPOREL COMMUN ===
# On prend l'échelle de temps d'un modèle comme référence
first_model_key = next(iter(telemac_data))
common_time = telemac_data[first_model_key]['time']

# Interpolation des données expérimentales sur le temps commun
interp_exp = interp1d(time_exp, depth_exp, kind='linear', fill_value='extrapolate')
depth_exp_aligned = interp_exp(common_time)

# === PLOT FINAL ===
plt.figure(figsize=(15, 7))

# Tracé de chaque modèle TELEMAC avec conversion en cm et décalage
for model_name, data in telemac_data.items():
    interp_model = interp1d(data['time'], data['values'] * 100, kind='linear', fill_value='extrapolate')
    depth_interp = interp_model(common_time)
    plt.plot(common_time - shift_telemac, depth_interp, label=model_name, alpha=0.7, linewidth=1.5)

# Tracé des données expérimentales décalées
plt.plot(common_time - shift_exp, depth_exp_aligned, label='Expérimental (C2)', color='black', linestyle='--', linewidth=2)

# === CONFIGURATION GRAPHIQUE ===
plt.title("Comparaison des modèles de turbulence - Capteur C2", fontsize=14)
plt.xlabel("Temps (s)", fontsize=12)
plt.ylabel("Hauteur d'eau (cm)", fontsize=12)
plt.grid(alpha=0.3)
plt.legend(loc='upper right')
plt.xlim(*xlim_range)

# === EXPORT ET AFFICHAGE ===
output_path = os.path.join(folder_path, 'Comparaison_C2_Final.png')
plt.savefig(output_path, dpi=300)
plt.tight_layout()
plt.show()

print(f"✅ Graphique exporté vers : {output_path}")
