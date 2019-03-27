function [cineq,ceq] = hw3_constraint(u)

cineq = [];
t = 0:0.1:8;
[tout,yout] = sim('hw3p1b',t',[],[t' u]);

%Hard Constraints
ceq(1) = 100 - yout(end,1);
ceq(2) = yout(end,2);
end
