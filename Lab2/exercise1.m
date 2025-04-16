clc
clear
n = 0:20;
A = 4;
a = -3/4;
B = 2;

%initializing u and r
u = zeros(size(n));
u(n>=0) = 1;
r10 = zeros(size(n));
r10(n>=5 & n < 15) = 1;


%calculating x and y
x = A*a.^n.*u;
y = B*r10;

%plotting x[n]
figure;
stem(n,x,"filled");
title("plot of x[n]")
xlabel("n");
ylabel("x[n]");

%plotting y[n]
figure;
stem(n,y,"filled");
title("plot of y[n]")
xlabel("n");
ylabel("y[n]");

%convolution with formula
z = conv(x,y);
n_z = 0:length(z)-1;

figure;
stem(n_z,z,"filled");
title("Convolution using matlab built-in function")
xlabel("n")
ylabel("Amplitude")
grid on


% Zero-pad x and y to the length of Nz
x_padded = [x, zeros(1, length(z) - length(x))];
y_padded = [y, zeros(1, length(z) - length(y))];

% take DFT of x and y
X = fft(x_padded); 
Y = fft(y_padded); 

% Multiply in the frequency domain
Z = X .* Y;

% IDFT
z_dft = ifft(Z);

figure;
stem(n_z, z_dft, "filled");
title("Convolution using matrix multiplication in frequency domain")
xlabel("n")
ylabel("Amplitude")


