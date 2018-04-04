
function rmsd_t = cost(Theta)
    global dt
    global k
    global x
    global t
    global data
    u = zeros(1,k/2);
    for i = 1:k/2
     u(i) = NNHypothesis(20, data(1,i), data(2, i), Theta);
    end
    W = sum(u)*dt;
    T = model(x, u, data(:, 1:k/2), dt);
    rmsd_t = sqrt(mean( (T(2, :) - t).^2 ));
end