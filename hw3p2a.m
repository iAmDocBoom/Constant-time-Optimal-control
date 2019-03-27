clear all;
clc;
 
t = 0:0.1:5;
% Sim with Initial control
 
u = 0.1 * ones(length(t),1);
u(26:end) = -0.1;
 
[t0,y0] = sim('hw3p2',t',[],[t' u]);
plot(t',u,'*');
title('Initial Control Input')
xlabel('Time');ylabel('u');

% Constrianed Optimization
 
lb = ones(51,1)*(-100);
ub = ones(51,1)*100;
 
options = optimset('Display','iter','PlotFcns','optimplotx');
 
[uf,cost] = fmincon('hw3p2cost',u,[],[],[],[],lb,ub,'hw3p2constraint',options);
% Sim with Optimal Control
 
[tout,xout,yout] = sim('hw3p2',t',[],[t' uf]);
figure;

plot(tout,uf,'o');
title('Optimal Control input')
xlabel('Time');ylabel('u*');

% Plotting State time histories
figure(2);
plot(tout,yout(:,1));
grid; xlabel('Time'); ylabel('Position x1');title('Position');
figure(3);
plot(tout,yout(:,2));
grid; xlabel('Time'); ylabel('Velocity x2');title('Velocity');
figure(4);
plot(tout,yout(:,3));
grid; xlabel('Time'); ylabel('Acceleration x3');title('Acceleration');
figure(5);
plot(tout,yout(:,4));
grid; xlabel('Time'); ylabel('Jerk x4');title('Jerk');
figure(6);
plot(tout,yout(:,5));
grid; xlabel('Time'); ylabel('Yank x5');title('Yank');
