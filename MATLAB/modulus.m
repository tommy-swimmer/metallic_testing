function [E,Y] = modulus(stress,strain)
%Calculating moduli using a range of percentage of ultimate stress at 50
%percent.
%   INPUT:
            % stress = stress given in MPa from function
            % strain = strain given in percent strain from function

%   OUTPUT:
            % E = modulus of elasticity

ult_stress = max(stress);

% Region to calculate modulus
s_min = ult_stress*.05;
s_max = ult_stress*.2;

% Stress and strain region of interest
E_range = [strain(stress > s_min & stress < s_max) stress(stress > s_min & stress < s_max)];

% Young's modulus polyfit.
polyfit_data = polyfit(E_range(:,1)/100,E_range(:,2),1); 

E = polyfit_data(1)/1000; % GPa

Y = polyfit_data(2)*10;


end

