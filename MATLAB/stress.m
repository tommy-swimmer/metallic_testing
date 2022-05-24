function [stressout] = stress(filename,cross_section,rangelow,rangehigh)
%This function will calculate the stress of data from MTS in Smash Lab.

%   INPUT:
%           filename = name of the file you want to analyze.
%           cross_section = cross section in square inches

%   OUTPUT:
%           stress = stress of the file.

% Reading table as a matrix.
read_table = readmatrix(filename);

% Referencing specific Range for Data
readrange = read_table((rangelow:rangehigh),:);

% Reading second column to find force in Newtons
force = readrange(:,2); % N

% Cleaning data and removing all values less than zero.
zero = force <0;
force(zero) = NaN;

% Creating cross-section data
cross_sectiondata = cross_section *645.16; % Cross-section converted to mm^2

% Stress Calculation

stress = force/ cross_sectiondata; % calculating stress in MPa

% Output in MPa - Units used are N/mm^2 which is 1*10^6 Pa. 
stressout = stress;

end

