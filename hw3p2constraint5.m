function [cineq,ceq] = hw3p2constraint5(u)
    cineq = [];
    t = 0:0.1:5;
    
    [tout,xout,yout] = sim('hw3p2',t',[],[t' u]);
    % Position, velocity, acceleration and jerk hard constraints
    ceq(1) = 15 - yout(end,1);
    ceq(2) = yout(end,2);
    ceq(3) = yout(end,3);
    ceq(4) = yout(end,4);
    ceq(5) = yout(end,5);
end
