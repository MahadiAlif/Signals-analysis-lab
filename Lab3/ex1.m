clc
[y, Fs] = audioread("audio2.mp3");

%Intially using FFT to calculate energy sperctra

y2 = y(40000:60000,1);
y3 = y(40000:80000,1);
y4 = y(40000:100000,1);

y2_fft = fftshift(fft(y(40000:60000,1)));
y3_fft = fftshift(fft(y(40000:80000,1)));

%measuring time for the maximmum extension
tic
y4_fft = fftshift(fft(y(40000:100000,1)));
toc

x2 = linspace(-Fs/2, Fs/2, 20001);
x3 = linspace(-Fs/2, Fs/2, 40001);
x4 = linspace(-Fs/2, Fs/2, 60001);

% Compute energy values for each signal
energy_y2 = (abs(y2_fft).^2); 
energy_y3 = (abs(y3_fft).^2);
energy_y4 = (abs(y4_fft).^2);

%plotting the signal with 20001 samples
figure;
plot(x2,pow2db(energy_y2), LineWidth=2, Color='g')
title("plot taking 20001 samples");
grid on
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");

%plotting the signal with 40001 samples
figure;
plot(x3,pow2db(energy_y3), LineWidth=2, Color='y')
title("plot taking 40001 samples");
grid on
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");

%plotting the signal with 60001 samples
figure;
plot(x4,pow2db(energy_y4),LineWidth=2,Color='r');
title("plot taking 60001 samples");
grid on
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");


%need to implement DFT using a loop and then compare the time required for
%each implementation using tic and toc funciton.

% Implementing DFT using a loop

N2 = length(y2);
N3 = length(y3);
N4 = length(y4);
y2_dft = zeros(1, N2);
y3_dft = zeros(1, N3);
y4_dft = zeros(1, N4);

tic;
for i = 0:N2-1
    for k = 0:N2-1
        y2_dft(i+1) = y2_dft(i+1) + y2(k+1)*exp(-1j * 2 * pi * k * i / N2);
    end
end
y2_dft = y2_dft / N2;  % Normalize
toc

for i = 0:N3-1
    for k = 0:N3-1
        y3_dft(i+1) = y3_dft(i+1) + y3(k+1)*exp(-1j * 2 * pi * k * i / N3);
    end
end
y3_dft = y3_dft / N3;

%measuring time for the highest extension
tic
for i = 0:N4-1
    for k = 0:N4-1
        y4_dft(i+1) = y4_dft(i+1) + y4(k+1)*exp(-1j * 2 * pi * k * i / N4);
    end
end
y4_dft = y4_dft / N4;
toc

% Plot energy spectrum using DFT
figure;
Y2_energy = (abs(fftshift(y2_dft)).^2);
plot(x2, pow2db(Y2_energy), LineWidth=2, Color='b');
title("Energy Spectrum using DFT (Manual Implementation)");
grid on;
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");

figure;
Y3_energy = (abs(fftshift(y3_dft)).^2);
plot(x3, pow2db(Y3_energy), LineWidth=2, Color='g');
title("Energy Spectrum using DFT (Manual Implementation)");
grid on;
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");

figure;
Y4_energy = (abs(fftshift(y4_dft)).^2);
plot(x4, pow2db(Y4_energy), LineWidth=2, Color='y');
title("Energy Spectrum using DFT (Manual Implementation)");
grid on;
xlabel("Frequency in KHz");
ylabel("Energy Spectrum");