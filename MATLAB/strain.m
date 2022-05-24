function [strainoutput] = strain(filename,rangelow,rangehigh)
% This function calculates strain from MTS in Smash Lab with extensometer.
%   INPUT:
%           deltaL = displacement from extensometer
%           rangelow = low range for data collection
%           rangehigh = high range for data collection
%   OUTPUT:
%           strainoutput = strain calculated in percent.

% NOTE: length of extensometer is 1 in = 25.4 mm as referenced in 
%       strainoutput variable. If not using the extensometer, THIS WILL
%       NOT WORK!!!

% Loading data from filename input.
readstrain = readmatrix(filename);

% Referencing specific Range for Data
readrange = readstrain((rangelow:rangehigh),:);

% Referencing fourth column, which contains axial extensometer.
delta = readrange(:,4);

% Zeroing out strain value.
deltazero = delta - delta(1);

% Calculating Percent Strain from deltaL / L
strainoutput = (deltazero / 25.4) *100;



end

