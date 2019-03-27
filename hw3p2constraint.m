function [cineq,ceq] = hw3p2constraint(u)
    cineq = [];
    t = 0:0.1:5;
    
    [tout,xout,yout] = sim('hw3p2',t',[],[t' u]);
    % Position Hard Contraints
    ceq(1) = 15 - yout(end,1);
