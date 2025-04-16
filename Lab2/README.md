# Signals and Systems – Lab Experience 2

This repository includes my solutions to the exercises from **Lab Experience 2** of the Signals and Systems course at Politecnico di Torino. The lab focuses on analyzing **Linear Time-Invariant (LTI)** systems using concepts such as convolution, transfer functions, and difference equations.

## 🧪 Lab Overview

- **Course**: Signals and Systems
- **Lab Topic**: LTI Systems – Convolution, Z-domain, and Impulse Response
- **Instructor**: Ann Margareth Rosa Brusin
- **Lab Dates**: 15th and 22nd November 2024
- **Report Deadline**: 5th December 2024

## 📂 Repository Structure

Lab2_Solutions/ │ ├── exercise_1_convolution.m # Convolution: definition, matrix, and built-in ├── exercise_2_lti_analysis.m # LTI system: Z-transform, poles/zeros, impulse response ├── exercise_3_difference_eq.m # Difference equation: system response and analysis ├── report.pdf # Report with plots, formulas, and explanations └── README.md # This README file


> 🧠 Exercises are implemented in MATLAB. Equivalent versions can be adapted easily.
using **Python**, `numpy`, `scipy`, and `matplotlib`.
## 📘 Exercises Overview

### ✅ Exercise 1: Convolution of Signals
- Implemented convolution in three ways:
  - Using the definition formula
  - Matrix-based multiplication
  - Built-in function (`numpy.convolve`)
- Signal Definitions:
  - `x[n] = 4 * (-3/4)^n * u[n]`
  - `y[n] = 2 * r10[n - 5]`
- Output: Plot signals and compare convolution results

---

### ✅ Exercise 2: LTI System Analysis
- Analyze an LTI system using a block diagram
- Tasks:
  - Derive transfer function \( H(z) \)
  - Write the corresponding difference equation
  - Compute poles, zeros, and Region of Convergence (ROC)
  - Determine impulse response analytically and verify via script
  - Use \( x[n] = (1/a)^n u[n] \) as input to compute \( y[n] \)

---

### ✅ Exercise 3: Difference Equation System
- Given: \( y[n] = k_1 x[n] + k_2 x[n-1] + k_3 x[n-2] \)
  - Coefficients: \( k_1 = \frac{1}{4}, k_2 = \frac{3}{4}, k_3 = -\frac{3}{4} \)
- Tasks:
  - Create block diagram and find transfer function \( H(z) \)
  - Determine poles and zeros
  - Analyze impulse response both analytically and by script
  - Evaluate system output for input \( x[n] = r5[n - 3] \)

## 📊 Requirements
- MATLAB or,
- Python 3.x
- Libraries: `numpy`, `matplotlib`, `scipy`

Run any script using:

MATLAB , run or
```bash
python exercise_1_convolution.py
