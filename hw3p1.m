clear all;
clc;

t = 0:0.1:8;
%sim with initial control
u = ones(length(t),1);
u(41:end) = -1;
[t0,y0] = sim('hw3p1b',t',[],[t' u]);
plot(t',u,'*');
title('Initial Control Input')
xlabel('Time');
ylabel('u');

%Constrained optimization

lb = ones(81,1)*(-100);
ub = ones(81,1)*(100);

options = optimset('Display','iter','PlotFcns','optimplotx');

[uf,cost] = fmincon('hw3_cost',u,[],[],[],[],lb,ub,'hw3_constraint',options);

%sim with optimal control

[tout,yout] = sim('hw3p1b',t',[],[t' uf]);
figure;
plot(tout,uf,'o');
title('Optimal Control Input')
xlabel('Time');
ylabel('u*');

%Plotting state time histories
figure;
plot(tout,yout(:,1));
grid;
xlabel('Time');
ylabel('State x1');
figure;
plot(tout,yout(:,2));
grid;
xlabel('Time');
ylabel('State x2');

