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
Theta = fminunc(@cost, rand(1,27))

X = x;
u = zeros(1,k);
T = (zeros(2,k));
T(:,1) = X;
for i = 1:k
    u(i) = hypothesis(X(1), data(1,i), data(2, i), Theta);
    X = modelStep(X,u(i),data(:,i),dt);
    T(:, i) = X;
end

A = sum(u)*dt /60/60/1000
rsmd_t = sqrt(mean( (T(2, :) - t).^2 ))

time = (1:k) *dt/60/60;
ax1 = subplot(3,1,1);
plot(ax1, time, T(1,:), time, T(2,:), time, data(1, :));
ax2 = subplot(3,1,2);
plot(ax2, time, data(2,:));
ax3 = subplot(3,1,3);
plot(ax3, time, u);
