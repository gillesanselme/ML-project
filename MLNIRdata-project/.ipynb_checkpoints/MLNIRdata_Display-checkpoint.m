%%% MLNIRdata_Display.m
%%% Display the MLNIRdata dataset: Machine Learning Near-InfraRed
%%% spectroscopy data for property prediction: 208 NIR hydrocarbon spectra
%%% with normalized density response
%%%
%%% Author:
%%% Laurent Duval, IFPEN Energies nouvelles
%%%
%%% Version:
%%% 1.0.0 (2025/08/08)
%%%
%%% Used in:
%%% Louna Alsouki et al.
%%% https://doi.org/10.1016/j.chemolab.2023.104813
%%% Chemometrics and Intelligent Laboratory Systems, 2023
%%% Dual-sPLS: A family of Dual Sparse Partial Least Squares
%%% regressions for feature selection and prediction with tunable sparsity;
%%% evaluation on  simulated and near-infrared (NIR) data

if exist('MLNIRdata_matrixXY_NirSpectrum_DensityNormalized.mat','file')
    load('MLNIRdata_matrixXY_NirSpectrum_DensityNormalized');
else
    matrixXNirSpectrumData = readmatrix('MLNIR_matrixX_NirSpectrumData.csv');
    matrixXNirSpectrumDataAxis = readmatrix('MLNIR_matrixX_NirSpectrumDataAxis.csv');
    matrixXNirSpectrumDerivative = readmatrix('MLNIR_matrixX_NirSpectrumDerivative.csv');
    matrixXNirSpectrumDerivativeAxis = readmatrix('MLNIR_matrixX_NirSpectrumDerivativeAxis.csv');
    matrixYNirPropertyDensityNormalized = readmatrix('MLNIR_matrixY_NirPropertyDensityNormalized.csv');
end

[~,nSpectrum] = size(matrixXNirSpectrumData);

colorList = colormap(jet(nSpectrum));
[dSort,iSort]  = sort(matrixYNirPropertyDensityNormalized);
colorListDensity = colorList(iSort,:);

figure('Name','MLNIR data (Original and S-G derivative): spectra and density property','NumberTitle','off');
tiledlayout(2,1)
ax1 = nexttile;
h1=plot(matrixXNirSpectrumDataAxis,matrixXNirSpectrumData);axis tight;grid on;
set(ax1,'XDir','reverse');
title(ax1,'MLNIR data (Original)');
xlabel(ax1,'Wavenumber (cm^{-1})');
ylabel(ax1,'Amplitude (a. u.)');
colororder(ax1,colorListDensity);
c1=colorbar;c1.Label.String = 'Density (normalized)';

ax2 = nexttile;
h2=plot(matrixXNirSpectrumDerivativeAxis,matrixXNirSpectrumDerivative);axis tight;grid on;
set(ax2,'XDir','reverse');
title(ax2,'MLNIR data (Savitzky-Golay derivative)');
xlabel(ax2,'Wavenumber (cm^{-1})');
ylabel(ax2,'Amplitude (a. u.)');
colororder(ax2,colorListDensity)
c1=colorbar;c1.Label.String = 'Density (normalized)';
