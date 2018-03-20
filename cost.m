
function rmsd_t = cost(Theta)
    global dt
    global k
    global x
    global t
    global data
    X = x;
    u = zeros(1,k);
    T = (zeros(2,k));
    T(:,1) = X;
    for i = 1:k
        u(i) = hypothesis(X(1), data(1,i), data(2, i), Theta);
        X = modelStep(X,u(i),data(:,i),dt);
        T(:, i) = X;
    end
    W = sum(u)*dt;
%     T = (T.*log(T) - (1-T).*log(1-T)).^2;
    rmsd_t = sqrt(mean( (T(1, :) - t).^2 ));
end