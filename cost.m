
function rmsd_t = cost(Theta)
    global dt
    global k
    global x
    global t
    global data
    global i
    global T

    u = NNHypothesis(T(1, i), data(1,i), data(2, i), Theta);
    X = modelStep(T(1, i), u, data(:,i), dt);
%     T = (T.*log(T) - (1-T).*log(1-T)).^2;
    rmsd_t = abs(X(1) - t);
end
