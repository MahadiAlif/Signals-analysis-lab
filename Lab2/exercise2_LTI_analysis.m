clc; clear; close all;

z = tf('z'); 
H = (2 + z) / (z^2 - z * (3/5) - 1/9);


% Compute poles and zeros of the system
poleH = pole(H)
zeroH = zero(H)


% Region of Convergence (ROC)
ROC = max(abs(poleH))

n = -5:20;

% computing impulse response analytically
p1 = poleH(1);
p2 = poleH(2);

% Compute coefficients A and B
A = (p1 + 2) / (p1 - p2);
B = (p2 + 2) / (p2 - p1);

% Initialize impulse response
h_n = zeros(size(n));
h_n(n >= 0) = A * (p1 .^ n(n >= 0)) + B * (p2 .^ n(n >= 0)); % Impulse response for n >= 0

% Plot analytical impulse response
figure;
stem(n, real(h_n), 'filled');
title('Analytical Impulse Response h[n]');
xlabel('n (Sample)');
ylabel('Amplitude');
grid on;

%now calculating impulse reponse using matlab function
figure;
impulse(H)
hold on
grid on

%calculating the output response
u = zeros(size(n));
u(n>=0) = 1;
a = 2;
x = ((1/a).^n).*u;

%plotting x
figure;
stem(n,x,"filled")
title("plot of x[n]")
xlabel("n")
ylabel("x[n]")
grid on

%computing y and plotting
y = conv(h_n,x);
n_y = 0:length(y)-1;
figure;
stem(n_y, y, "filled")
title("plot of y[n]")
xlabel("n")
ylabel("y[n]")
grid on
