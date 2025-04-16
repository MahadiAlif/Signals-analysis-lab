clc
clear
z = tf('z');
k1 = 1/4;
k2 = 3/4;
k3 = -3/4;
n = 0:20;
H = ((k1*z^2)+(k2*z)+k3)/z^2;
zeroH = zero(H)
poleH = pole(H)

ROC = max(abs(poleH))

%impulse response analytically
delta = zeros(size(n));
delta1 = zeros(size(n));
delta2 = zeros(size(n));
delta(n == 0) = 1;
delta1(n == 1) = 1;
delta2(n == 2) = 1;
h_n = k1*delta + k2*delta1 + k3*delta2;
stem(n,h_n, "filled")
title("Impulse response plot analytically")
xlabel("n")
ylabel("h[n]")
grid on


%impulse response with a script
figure;
impulse(H);
grid on


%computing and plotting x[n]
r5 = zeros(size(n));
r5(n>=3 & n<8) = 1;
x = r5;
figure;
stem(n,x,"filled");
title("plot of x[n]");
xlabel("n");
ylabel("x[n]");
grid on

%computing and plotting y[n] = h[n] * x[n]
y = conv(h_n,x);
n_y = 0:length(y)-1;
figure;
stem(n_y,y,"filled")
title("plot of y[n]")
xlabel("n")
ylabel("y[n]")
grid on
