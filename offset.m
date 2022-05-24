function [E] = offset(stress,strain)
%Calculating moduli using the 0.2% offset method.
%   INPUT:
            % stress = stress given in MPa from function
            % strain = strain given in MPa from function

%   OUTPUT:
            % E = modulus of elasticity

% POLYFITTING DATA
% Going to polyfit 0.1% of the total array values to get a polyfit
% in the linear elastic region of the plot. 

stress_poly = 0.1 * length(stress);
strain_poly = 0.1 * length(strain);

polyfit_data = polyfit(strain_poly,stress_poly,1);

E = polyfit_data(1) / 1000; % GPa


end

