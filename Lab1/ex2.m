clc;
clear;

N = 8;  % Given value of N
n = 0:N-1;  % Define range of n

% Define the signals x[n] and y[n]
x = exp(1j * 4 * pi * n / N);
y = exp(1j * 8 * pi * n / N);

% Plot the real and imaginary parts of x[n]
figure;
stem(n, real(x), 'b', 'DisplayName', 'Real Part of x[n]');
hold on;
stem(n, imag(x), 'r', 'DisplayName', 'Imaginary Part of x[n]');
title('Signal x[n]');
xlabel('n');
ylabel('Amplitude');
legend;
grid on;

% Plot the real and imaginary parts of y[n]
figure;
stem(n, real(y), 'b', 'DisplayName', 'Real Part of y[n]');
hold on;
stem(n, imag(y), 'r', 'DisplayName', 'Imaginary Part of y[n]');
title('Signal y[n]');
xlabel('n');
ylabel('Amplitude');
legend;
grid on;

% Calculate energy and average power for x[n] and y[n]
energy_x = sum(abs(x).^2);
energy_y = sum(abs(y).^2);
average_power_x = mean(abs(x).^2);
average_power_y = mean(abs(y).^2);

% Display the energy and average power values
fprintf('Energy of x[n]: %.2f\n', energy_x);
fprintf('Energy of y[n]: %.2f\n', energy_y);
fprintf('Average Power of x[n]: %.2f\n', average_power_x);
fprintf('Average Power of y[n]: %.2f\n', average_power_y);

% Check for orthogonality
inner_product = sum(x .* conj(y));
fprintf('Inner Product of x[n] and y[n]: %.2f\n', inner_product);

% Check if they are orthogonal
if abs(inner_product) < 1e-10  % Tolerance to handle numerical precision
    disp('The signals x[n] and y[n] are orthogonal.');
else
    disp('The signals x[n] and y[n] are not orthogonal.');
end
