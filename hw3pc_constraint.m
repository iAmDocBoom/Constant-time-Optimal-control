function [cineq,ceq] = hw3pc_constraint(u)

cineq = [];
t = 0:0.1:8;
[tout,yout] = sim('hw3p1b',t',[],[t' u]);

%Hard Constraints
cineq = 100-yout(end,1);
ceq = cineq;
end
