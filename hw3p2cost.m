function cost = hw3p2cost(u)
    cost = 0.5 * 0.1 * trapz(u.*u);
end
