function [yieldoutput,xi] = yield(modulus, polyfitdata,stress,strain)
% Calculates the yield strength given stress strain values. This function
% will use a 0.2% offset to accomplish this.
%   OUTPUT:

%   INPUT

% Using point-slope form (y - y1) = m(x - x1)

x = linspace(0.2,5);

y = (modulus*10) .* (x - 0.2) + polyfitdata;

%plot(x,y) %use this to confirm if you want.

[xi,yieldoutput] = polyxpoly(strain,stress,x,y); % finds intersection of points

% look up polyxpoly to find more info on what this function does.



end

