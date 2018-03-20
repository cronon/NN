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
Theta = fminunc(@cost, [0 7000]);
u = hypothesis(data(1,:), Theta);
T = model(x, u, data, dt, k);

time = T(1, :);
ax1 = subplot(2,1,1);
plot(ax1, time, T(2,:), time, T(3,:), time, data(1, :));
ax2 = subplot(2,1,2);
plot(ax2, time, u);

