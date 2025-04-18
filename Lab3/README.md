# Signals and Systems – Lab Experience 3 (MATLAB Version)

This repository contains my solutions to **Lab Experience 3** of the Signals and Systems course at Politecnico di Torino. This lab focuses on the **Discrete Fourier Transform (DFT)**, **Fast Fourier Transform (FFT)**, and **circular convolution**, with practical applications in audio signal processing.

## 🧪 Lab Overview

- **Course**: Signals and Systems  
- **Lab Topic**: DFT, FFT, and Circular Convolution  
- **Instructor**: Ann Margareth Rosa Brusin  
- **Lab Dates**: December 6 and 13, 2024  
- **Report Deadline**: January 7, 2025  

## 📂 Repository Structure

Lab3_Solutions/ │ ├── exercise_1_dft_fft.m # Spectral analysis using DFT and FFT ├── exercise_2_circular_convolution.m # Filtering using circular and time-domain convolution ├── FIR_impulse_response.mat # Given FIR filter (raised-cosine) ├── music_sample.wav # Audio file used in the lab ├── report.pdf # Analytical report with plots and explanations └── README.md # This file


## 📘 Exercises Overview

### ✅ Exercise 1: DFT and FFT on Audio Signals

- Load a **music file** (≥ 20 seconds) using `audioread()`
- Determine the **sampling frequency** \( F_s \)
- Divide the signal into **K temporal windows** of length **M seconds**
  - Try different values of **M**
- For each window:
  - Estimate the energy spectrum using:
    - Your own implementation of the **DFT**
    - MATLAB’s built-in **FFT** function
- Plot and compare:
  - Energy spectra (in dB) over time
  - Computational time using `tic` and `toc`
- Use `fftshift()` when needed to center the frequency components
- Express frequency axis in **kHz**

---

### ✅ Exercise 2: DFT and Circular Convolution

- Use a 10-second segment of the music file
- Filter it with the given **FIR filter** `FIR_impulse_response.mat`  
  (raised-cosine filter with 10% bandwidth)

Perform the filtering:
- In **time domain** using linear convolution (`conv`)
- In **frequency domain** using **circular convolution**:
  - Apply DFT to both signal and impulse response
  - Use zero-padding so that:
    \[
    N \geq N_x + N_h - 1
    \]
  - Optionally use FFT with \( N = 2^m \), where \( m = \lceil \log_2(N_x + N_h - 1) \rceil \)

**Required Outputs:**
- Compare the **filtered signals** in time domain
- Plot the **energy spectra** before and after filtering (both methods)
- Optionally, use `soundsc()` to listen to the audio before and after filtering

---

## ⚙️ Requirements

- MATLAB (any recent version)
- Signal Processing Toolbox recommended (but not strictly necessary)

To run any script:

```matlab
% Example
exercise_1_dft_fft
