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

## Notes

- Many files are research artifacts and intermediate outputs.
- Heavy archives and office/PDF deliverables are excluded from Git tracking to keep the repository pushable.
