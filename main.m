% cost function takes vector of vars and a hypothesis and returns a cost
% hypothesis takes vector of vars and returns vector of powers
% 
% no heating, night
% dt = 60; % 60 seconds
% time = 48*60*60; % 8 hours
% k = time / dt;
% x = [20; 0];
% u = ones(1, k)*5000;
% d = [-20*ones(1, k); 0*ones(1,k)];
% t = model(x, u, d, dt, k);
% plot(t(1,:), t(2,:), t(1,:), t(3,:));
% cost(20, t(2,:), u, dt)
cost([6.1; 4999.7])
% fminunc(@cost, [0 5000])