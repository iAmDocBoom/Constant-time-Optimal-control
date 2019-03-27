function cost = hw3_cost(u)
cost = 0.5*0.1*trapz(u.*u);
end