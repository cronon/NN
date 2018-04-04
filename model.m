% x - [Tindoor; Twall] - initial values of temperatures
% u - k-vector of power consumed by heater
% d - 2xk matrix of temperatures outside and power of solar radiation
% returns t - 2xk matrix room and wall temperatures
function t = model(x, u, d, dt)
k = length(u);
COP = 1;
U = 1/0.287; % heat transfer coeff
beta = 0.2; % fracion of solar radiation heating the room
gamma = 0.8; % heating walls
% room 8x6x2.5
Aw = 2.5*2*6 + 2.5*2*8; % four walls
UA = U*Aw; % heat transfer flux?

Volume = 8*6*2.5;
Cb = Volume*1.205*1005; % thermal capacity of the room
Cw = 1*8*6*0.25*1800*800; % thermal capacity of walls

A = [-UA/Cb UA/Cb; UA/Cw -2*UA/Cw];
B = [COP/Cb; 0];
E = [0 beta/Cb; UA/Cw gamma/Cw];
C = [1 0];
t = zeros(3, k);
for i = 1:k
  t(:, i) = [i*dt/60/60; x];
  x = x + A*x*dt + B*u(i)*dt + E*d(:, i)*dt;
end
end
