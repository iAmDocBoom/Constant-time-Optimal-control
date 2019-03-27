function [cineq,ceq] = hw3p2constraint3(u)
    cineq = [];
    t = 0:0.1:5;
    
    [tout,xout,yout] = sim('hw3p2',t',[],[t' u]);
    % Position, velocity and acceleration hard constraints
    ceq(1) = 15 - yout(end,1);
    ceq(2) = yout(end,2);
    ceq(3) = yout(end,3);
end