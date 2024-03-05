% Given Constants
V = 9;    % Voltage (volts)
R = 4;    % Resistance (ohms)
C = 1;    % Capacitance (farads)
Q_target = 8;  % Target charge

% Trimming vectors to the required size
%t = t(1:idx);
%Q = Q(1:idx);
dt = 0.1;  % time step
t = 0:dt:100;  % If the time vector is large, it gets trimmed down
% t = 0:0.1:100; 
Q = V * (1 - exp(-t/(R*C)));  % Charge calculation

% Finding the time at which the charge exceeds 8 units
%idx = find(Q > Q_target, 1, 'first');
%time_to_reach_target = t(idx);
%charge_at_target = Q(idx);

% Find the index where charge just exceeds 8 units
idx_exceeds_8 = find(Q > 8, 1, 'first');

% Time and charge while charge is strictly less than 8 units
time_less_than_8 = t(1:idx_exceeds_8-1);
charge_less_than_8 = Q(1:idx_exceeds_8-1);

% Displaying the time and charge every 0.1 seconds
% This goes on until the cahrge exceeds 8 units
%for i = 1:length(t)
%    fprintf('Time: %.1f s, Charge: %.2f units\n', t(i), Q(i));
%end

% Displaying the charge and time while the charge is less than 8 units
for i = 1:length(time_less_than_8)
    fprintf('Time: %.1f s, Charge: %.2f units\n', time_less_than_8(i), charge_less_than_8(i));
end


% Plotting the charge over time
%plot(t, Q, 'b-'); % plotted with a blue line
%xlabel('Time (s)');
%ylabel('Charge (units)');
%title('Charge on Capacitor Over Time');
%grid on;

plot(time_less_than_8, charge_less_than_8, 'b-');
xlabel('Time (s)');
ylabel('Charge (units)');
title('Charge on the Capacitor');
grid on;
