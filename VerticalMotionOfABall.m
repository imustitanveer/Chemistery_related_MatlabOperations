% Data
u = 40; % initial speed in m/s
g = 9.81; % acceleration due to gravity in m/s^2

% Time vector
t = 0:0.2:20.5;

% calculating Vertical displacement
s = u * t - 0.5 * g * t.^2;

% Plotting the vertical motion of the ball
plot(t, s);
xlabel('Time (seconds)');
ylabel('Vertical Displacement (meters)');
title('Vertical motion of the ball');
