function F = clogging(sigma)
global poro S us
xp=0.45*((S^0.61)/(us^0.24));
yp=1.5;
zp=0.75;
b= 29/(S^0.65);
sigmau= poro/((1+us)^0.75);
 
F = (1+b*(sigma/poro)).^yp .* (1-sigma/poro).^zp .* (1-sigma/sigmau).^xp; % clogging equation 35
%F=1 base case no effect of clogging


function dsigma = sigma_in_ODE(teta,sigma,us,lambda0,Cin)
dsigma = us*lambda0*clogging(sigma)*Cin; %eq 33

function dsigma = sigma_ODE(teta,sigma,lambda0)
dsigma = -lambda0*clogging(sigma).*sigma; %eq 32