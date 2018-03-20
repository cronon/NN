
% T - vector of temeratures
function rmsd_t = cost(Theta)
    dt = 60; % 60 seconds
    time = 48*60*60; % 8 hours
    k = time / dt;
    x = [20; 0];
    u = ones(1, k)*5000;
    d = [-20*ones(1, k); 0*ones(1,k)];
    
    u = d(1,:)*Theta(1) + Theta(2);
    T = model(x, u, d, dt, k);
     plot(T(1,:), T(2,:), T(1,:), T(3,:));
    t = 20;
    rmsd_t = sqrt(mean( (T(2, :) - t).^2 ));
end