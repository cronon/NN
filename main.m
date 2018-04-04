% cost function takes vector of vars and a hypothesis and returns a cost
% hypothesis takes vector of vars and returns vector of powers
% ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/subhourly01/HEADERS.txt
globals();
global dt
global k
global x
global t
global data
% plot(t(1,:), t(2,:), t(1,:), t(3,:));
% cost(20, t(2,:), u, dt)
% cost([6.1; 4999.7])
Theta = rand(1,27);
Theta = fminunc(@cost, Theta)
u = zeros(1,k);
    for i = k/2:k
     u(i) = NNHypothesis(20, data(1,i), data(2, i), Theta);
    end
u = u(:, k/2:k);
T = model(x, u, data(:,k/2:k), dt);
A = sum(u)*dt /60/60/1000
rsmd_t = sqrt(mean( (T(2, :) - t).^2 ))

time = T(1, :);
ax1 = subplot(3,1,1);
plot(ax1, time, T(2,:), time, T(3,:), time, data(1, k/2:k));
ax2 = subplot(3,1,2);
plot(ax2, time, data(2,k/2:k));
ax3 = subplot(3,1,3);
plot(ax3, time, u);


