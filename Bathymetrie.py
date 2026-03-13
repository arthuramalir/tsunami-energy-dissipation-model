import numpy as np
import matplotlib.pyplot as plt
#import panda as pd

def distance(x, y, x_centre, y_centre, radius):
    return np.sqrt((x - x_centre)**2 + (y - y_centre)**2) - radius

# Paramètres
nb_cylindres = 8
hauteur = 2
r = 0.2
espacement = 1
resolution = 0.05


# Création de la grille
x = np.arange(0, nb_cylindres*espacement+20, resolution)
y = np.arange(0, nb_cylindres*espacement+20, resolution)
X, Y = np.meshgrid(x, y)

# Création des centres des cylindres
centers = np.array([[10+i*espacement, 10+j*espacement] for i in range(nb_cylindres) for j in range(nb_cylindres)])

# Calcul des distances pour tous les points de la grille et tous les cylindres
distances = np.array([distance(X, Y, center[0], center[1], r) for center in centers])
z = hauteur * (distances <= 0).any(axis=0)

# Visualisation
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
surf = ax.plot_surface(X, Y, z, cmap=plt.cm.coolwarm, linewidths=0, antialiased=False)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
fig.colorbar(surf, shrink=0.5, aspect=10)
plt.title("Bathymétrie")
plt.show()

data = np.column_stack((X.ravel(), Y.ravel(), z.ravel()))

# Enregistrer le tableau dans un fichier CSV
np.savetxt("cylindres_bathymetrie.xyz", data, delimiter=",", header="X,Y,Z", comments="")

print("Données enregistrées dans 'cylindres_bathymetrie.csv'.")
