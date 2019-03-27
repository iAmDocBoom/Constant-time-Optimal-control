function [cineq,ceq] = hw3p2constraint2(u)
    cineq = [];
    t = 0:0.1:5;
    
    [tout,xout,yout] = sim('hw3p2',t',[],[t' u]);
    % Position and velocity hard constraints
    ceq(1) = 15 - yout(end,1);
    ceq(2) = yout(end,2);
