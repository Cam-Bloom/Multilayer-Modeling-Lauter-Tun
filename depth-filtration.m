%% Clear workspace
clc,clear ,close all
%% Parameters 
global poro S us % Global varibles to be used in functions
 
dg = 2.514; % mm
hfinal = 0.318; % m
tfinal = 14; % s
sigma0 = 0; % m3/m3
Cin = 0.043; %kg/dm3
%sigma0 = 0.308751504730243; % m3/m3 2nd filtration run 
%Cin = 0.006012114;%kg/dm3 2nd filtration run
%Cin = 1.287280000000000e-04; %kg/dm3 3rd filtration run
%sigma0 =0.386490469840771 % m3/m3 3rd filtration run
poro = 0.583; % porosity 
us = hfinal/tfinal; %ms-1
S = (6*(1-poro))/(dg); %1/mm
lambda0 = 1.145*((S^1.35)/(us^0.25)); %filtration coefficient 
 
%% Steps
tstep = 0.5; % time step 
t = [0:tstep:tfinal];% time vector
nsteps = (tfinal/tstep); % step number 
h = [0:hfinal/(nsteps):hfinal]; % height vector
 
%% ODEs
[teta_in, sigma_in] = ode45(@(teta,sigma) sigma_in_ODE(teta,sigma,us,lambda0,Cin),t,sigma0); % Solving ODE for specific deposit in, equation 33
 
[z, sigma] = ode45(@(teta,sigma) sigma_ODE(teta,sigma,lambda0),h,sigma_in); % Solving ODE for specific deposit over height for any given time, equation 32 
 
sigma_inT = sigma_in'; % transpose so able to use for calculations
C = (sigma./sigma_inT)*Cin;% Concentration eqaution 34
 
MC= mean(C,2,'omitnan'); % calulates the mean of row omitting nan values 
Cout = MC(29,1); % Concentation out/ turbidity cocentration
 
%% Message
Cout = round(Cout,9); % rounding for display
Turbidity = ['The turbitidy of the runoff is ',num2str(Cout*10^6),' mg/l']; % text string
disp(Turbidity) % dispay string
 
%% Plots 
subplot(1,2,1) %surf plot with modifiers 
surf(h,t,sigma')
zlabel('Specific deposit \sigma (m3/m3)')
xlabel('Distance z (m)')
set(gca,'XTick',[0:0.05:0.45])
ylabel('Time t (s)')
 
subplot(1,2,2)%surf plot with modifiers
surf(h,t,C')
zlabel('Particle concentration (kg/dm3)')
xlabel('Distance z (m)')
set(gca,'XTick',[0:0.05:0.45])
ylabel('Time t (s)')
