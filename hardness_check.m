% Hardness Check
% Tommy Swimmer
% April 2, 2020
% For Smash Lab Tensile Testing Report

clear
clc

%% Checking

% HV ~= 0.1891*(F / A)

% 1 gram-force = 0.980665 Newton

F = 0.5; % kgf

d = [56.43 60.93 58.76 58.71 45.64 45.51 45.44 45.53 46.92 47.97 47.35 ...
    47.41]*0.001; %mm

A = (d.^2) ./ (2.*sind(136./2));

HV = (1.8544*F) ./ d.^2; %kgf / mm^2

HV_better = F ./ A ; % HV and HV_better gives pretty much the same numbers...

HV_excel = [267.8 261.6 269.0 266.1 429.5 405.9 441.7 425.7 405.0 393.1 433.6 410.6];

approx_error = abs((HV_better - HV_excel)./(HV_better))*100;

average_error = mean(approx_error);