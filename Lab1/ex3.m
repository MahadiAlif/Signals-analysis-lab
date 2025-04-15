clc;
clear;


x = [3; 2; -1; 4]; %values of signal for n = 0 to 3
N = length(x);  % Signal length N = 4

% Canonical basis U_delta (Identity matrix)
U_delta = eye(N);

% Fourier basis U_F
U_F = (1/sqrt(N)) * [1, 1, 1, 1;
                     1, exp(-1j*2*pi/4), exp(-1j*2*pi*2/4), exp(-1j*2*pi*3/4);
                     1, exp(-1j*2*pi*2/4), exp(-1j*2*pi*4/4), exp(-1j*2*pi*6/4);
                     1, exp(-1j*2*pi*3/4), exp(-1j*2*pi*6/4), exp(-1j*2*pi*9/4)];

%custom basis, I am using rotated identity matrix for simplicity
theta = pi/4;  % Rotation angle
U_custom = [cos(theta), -sin(theta), 0, 0;
            sin(theta), cos(theta), 0, 0;
            0, 0, cos(theta), -sin(theta);
            0, 0, sin(theta), cos(theta)];

% Compute the coefficients for each basis
c_delta = U_delta' * x;
c_Fourier = U_F' * x;
c_custom = U_custom' * x;

% Display the coefficients
disp('Coefficients in Canonical Basis (U_delta):');
disp(c_delta);

disp('Coefficients in Fourier Basis (U_F):');
disp(c_Fourier);

disp('Coefficients in Custom Orthonormal Basis (U_custom):');
disp(c_custom);

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
stem(abs(c_custom), 'filled');
title('Coefficients in Custom Orthonormal Basis');
xlabel('Coefficient Index');
ylabel('Magnitude');
grid on;
