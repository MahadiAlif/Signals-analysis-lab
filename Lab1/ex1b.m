a = 1.5;
n_values = [];
signal_values = [];
energy_values = [];
power_values = [];

% Loop through different extension sizes to observe convergence
for i = 1:10
    n = -i:i;  % Extend range of n for each iteration
    n_values = [n_values, n];

    % Compute the signal x[n] = a^|n|
    signal = a.^abs(n);
    signal_values = [signal_values, signal];

    % Calculate energy and power for the current extension
    energy = sum(abs(signal).^2);  % Numerical energy calculation
    energy_values = [energy_values, energy];

    power = mean(abs(signal).^2);  % Numerical power calculation
    power_values = [power_values, power];
end

% Define the iteration values for plotting energy and power vs. extension size
i_values = 1:10;

% Plot the signal (use stem for discrete signal as per instructions)
figure;
stem(n_values, signal_values);  % Stem plot for x[n] = a^|n|
title('Signal Values over Different n');
xlabel('n values');
ylabel('Signal Amplitude');
grid on;

% Plot power values to show convergence over increasing extension sizes
figure;
plot(i_values, power_values);
title('Power Values over Iterations');
xlabel('Iteration (i)');
ylabel('Power');
grid on;

% Plot energy values to show convergence over increasing extension sizes
figure;
plot(i_values, energy_values);
title('Energy Values over Iterations');
xlabel('Iteration (i)');
ylabel('Energy');
grid on;


% Display numerical results to compare with theoretical values
disp('Numerical Energy Values:');
disp(energy_values);

disp('Numerical Power Values:');
disp(power_values);
