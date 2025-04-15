clc;
clear;

N = 128;  % Signal length

% shifted Rademacher sequence x[n] = r_88[n - 5]
n = 0:N-1;
x = double(bitget(n + 5, 7));  % Generate r_88 and shifted by 5 (7th bit for r_88)

% Canonical basis U_delta (Identity matrix)
U_delta = eye(N);

% Fourier basis U_F
U_F = (1/sqrt(N)) * exp(-1j * 2 * pi * (0:N-1)' * (0:N-1) / N);

% Walsh basis U_W (Walsh function generation for N=128)
U_W = hadamard(N) / sqrt(N);  % Hadamard matrix scaled for Walsh basis

% Compute the projection coefficients for each basis
c_delta = U_delta' * x';
c_Fourier = U_F' * x';
c_Walsh = U_W' * x';

% Calculate energy in the time domain
energy_time = sum(abs(x).^2);

% Calculate energy in each basis and verify Parseval's equality
energy_delta = sum(abs(c_delta).^2);
energy_Fourier = sum(abs(c_Fourier).^2);
energy_Walsh = sum(abs(c_Walsh).^2);

% Display energies to check Parseval's theorem
fprintf('Energy in time domain: %.2f\n', energy_time);
fprintf('Energy in Canonical basis: %.2f\n', energy_delta);
fprintf('Energy in Fourier basis: %.2f\n', energy_Fourier);
fprintf('Energy in Walsh basis: %.2f\n', energy_Walsh);

% Verify if Parseval's theorem holds
if abs(energy_time - energy_delta) < 1e-10 && ...
   abs(energy_time - energy_Fourier) < 1e-10 && ...
   abs(energy_time - energy_Walsh) < 1e-10
    disp('Parsevals equality is verified for all bases.');
else
    disp('Parsevals equality is not verified for one or more bases.');
end

% Plot the original signal
figure;
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot the coefficients for each basis
figure;
stem(abs(c_delta), 'filled');
title('Coefficients in Canonical Basis');
xlabel('Coefficient Index');
ylabel('Magnitude');
grid on;

figure;
stem(abs(c_Fourier), 'filled');
title('Coefficients in Fourier Basis');
xlabel('Coefficient Index');
ylabel('Magnitude');
grid on;

figure;
stem(abs(c_Walsh), 'filled');
title('Coefficients in Walsh Basis');
xlabel('Coefficient Index');
ylabel('Magnitude');
grid on;
