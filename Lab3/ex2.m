clc
clear
[y, Fs] = audioread("audio.m4a");
load('FIR_impluse_response.mat');
y2 = y(40000:60000,1);
N = length(y2);
x2 = linspace(-Fs/2,((Fs/2)-(Fs/(2*N))), N);

%energy spectrum original
y_energyspectra_original = abs(fft(y2)).^2;

%In time domain
y2_filtered = conv(y2,h, "same");
Y_energyspectra_time = abs(fft(y2_filtered)).^2;

%In frequency domain
H = fft(h, length(y2));
y2_fft = fft(y2);
Y = H.*y2_fft; %multiplication in frequencty domain

Y_filtered_frequency = ifft(Y);
Y_energyspectra_frequency = abs(Y).^2;

% Plotting original and time domain filtered energy spectra
figure;
hold on; 

plot(x2, pow2db(y_energyspectra_original), 'b', 'DisplayName', 'Original Signal'); % Blue for original
plot(x2, pow2db(Y_energyspectra_time), 'r', 'DisplayName', 'Time-Domain Filtered'); % Red for time-domain filtered
title("Comparison between original and time domain filtered energy spectra")
xlabel("Frequency (Hz) ")
ylabel("Energy Spectra")
grid on

%plotting original and frequency domain filtered energy spectra
figure;
hold on
plot(x2, pow2db(y_energyspectra_original), 'b', 'DisplayName', 'Original Signal'); % Blue for original
plot(x2, pow2db(Y_energyspectra_frequency), 'g', 'DisplayName', 'Frequency-Domain Filtered'); % Yellow for frequency-domain filtered
title("Comparison between original and frequency domain filtered energy spectra")
xlabel("Frequency (Hz) ")
ylabel("Energy Spectra")
grid on


%-fs/2 to (fs/2)-(fs/2N)