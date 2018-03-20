

% T - vector of temeratures
function rmsd_t = cost(Theta)
    global dt
    global k
    global x
    global t
    global data
    u = hypothesis(data(1,:), Theta);
    T = model(x, u, data, dt, k);
    rmsd_t = sqrt(mean( (T(2, :) - t).^2 ));
end