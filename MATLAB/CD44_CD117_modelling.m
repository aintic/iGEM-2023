%Modeling tumor interaction with CAR-T and memory CAR-T cells over t
clc
clear all
close all

timeofinjection = 42;
%Conversion coefficient of memory CAR-T to effector
theta44 = 0.000006;
theta117 = 0.000006; 
%Numerical parameter
deltaT = 0.001;
%Tumor proliferation rate
r = 0.05650026;
%Tumor death by CAR-T -> cytotoxic coefficient
gamma44 = 0.000003715843;
gamma117 = 0.000003715843;
%Inverse of tumor support capacity
b = 0.000000000001404029;
%CAR-T proliferation rate
phi44 = 0.265;
phi117 = 0.265;
%effector CAR-T cell reduction rate
rho44 = 0.35;
rho117 = 0.35;
%CAR-T inhibition
alpha44 = 0.000000045;
alpha117 = 0.000000045;
%Effector to memory conversion rate
e44 = 0.15;
e117 = 0.15;
%Memory CAR-T death rate
u44 = 0.005;
u117 = 0.005;

%Define the amount of cells
%Number of tumor cells
T = 2*10.^6;
%Number of CAR-T cells
Ct44 =  10*10.^6;
Ct117 =  10*10.^6;

%D(1) = Car-T cells
%D(2) = Memory Car-T cells
%D(3) = Tumor cells

%CAR-T for CD44 only

f44 = @(t,D) [
    phi44*D(1) - rho44*D(1) + theta44*D(3)*D(2) - alpha44*D(3)*D(1);
    e44*D(1) - theta44*D(3)*D(2) - u44*D(2);
    r*D(3)-r*b*D(3)^2-gamma44*D(1)*D(3)];

[t44, Dct44] = ode45(f44, [0 timeofinjection], [0,0,T]);
tplot = t44;
yplot = Dct44;

[t44, Dct44] = ode45(f44, [tplot(end) 100], [Ct44,Dct44(end,2),Dct44(end,3)]);
tplot = [tplot; t44];
yplot = [yplot; Dct44];

subplot(1,3,1)
plot(tplot, yplot)

%CAR-T for CD117 only

f117 = @(t,D) [
    phi117*D(1) - rho117*D(1) + theta117*D(3)*D(2) - alpha117*D(3)*D(1);
    e117*D(1) - theta117*D(3).*D(2) - u117*D(2);
    r*D(3)-r*b*D(3)^2-gamma117*D(1)*D(3)];

[t117, Dct117] = ode45(f117, [0 timeofinjection], [0,0,T]);
tplot = t117;
yplot = Dct117;

[t117, Dct117] = ode45(f117, [tplot(end) 100], [Ct117,Dct117(end,2),Dct117(end,3)]);
tplot = [tplot; t117];
yplot = [yplot; Dct117];

subplot(1,3,2)
plot(tplot, yplot)

%CAR-T for CD44 and Car-T for CD117 both

%D(1) = Car-T for CD44
%D(2) = Car-T for CD117
%D(3) = Memory Car-T for CD44
%D(4) = Memory Car-T for CD117
%D(5) = Tumor cells

f44_117 = @(t,D) [
    phi44*D(1) - rho44*D(1) + theta44*D(5)*D(3) - alpha44*D(5)*D(1);
    e44*D(1) - theta44*D(5)*D(3) - u44*D(3);
    phi117*D(2) - rho117*D(2) + theta117*D(5)*D(4) - alpha117*D(5)*D(2);
    e117*D(2) - theta117*D(5)*D(4) - u117*D(4);
    r*D(5)-r*b*D(5)^2-gamma44*D(1)*D(5)-gamma117*D(2)*D(5)];

[t44_117, Dct44_117] = ode45(f44_117, [0 timeofinjection], [0,0,0,0,T]);
tplot = t44_117;
yplot = Dct44_117;

[t44_117, Dct44_117] = ode45(f44_117, [tplot(end) 100], [Ct44,Ct117,Dct44_117(end,3),Dct44_117(end,4),Dct44_117(end,5)]);
tplot = [tplot; t44_117];
yplot = [yplot; Dct44_117];

subplot(1,3,3)
plot(tplot, yplot)

% end