function globals()
global dt
dt = 5*60;
global time
time = 7*24*60*60;
global k
k = time / dt;
global x
x = [20; 0];
global t
t = 20;
stats = load('AK_Barrow.txt');
global data
data = [stats(:,9)'; 0*ones(1,k)];
end