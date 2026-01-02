# Stochastic Modeling & Statistical Distribution Analysis

This project investigates the statistical structure of an unknown dataset using probabilistic modeling, distribution fitting, and simulation-based validation. The goal is to identify the underlying distribution governing the data and verify its properties through theoretical and empirical methods.

The work demonstrates applied understanding of probability theory, random variable transformations, and statistical inference, using both analytical reasoning and computational experimentation.

---

## 📌 Project Overview

Given a dataset with unknown origin, this project aims to:

- Identify the most likely generating probability distribution  
- Validate the hypothesis using statistical diagnostics  
- Transform the data to test distributional assumptions  
- Demonstrate theoretical results such as the Central Limit Theorem  

The analysis is carried out in **R**, using reproducible scripts and visualizations.

---

## 🔍 Methodology

### 1. Exploratory Analysis
- Histogram and summary statistics
- Estimation of mean and variance
- Visual inspection of data shape

### 2. Distribution Identification
- Comparison against common distributions (Normal, Exponential, Gamma)
- Parameter estimation using the **Method of Moments**
- Analytical validation using known distribution properties

### 3. Distribution Transformation
- Probability Integral Transform (CDF → Uniform)
- Inverse CDF transformation to standard normal
- Visual verification via histograms and Q–Q plots

### 4. Statistical Validation
- Comparison between theoretical and empirical moments
- Normality checks using quantile plots
- Empirical verification of the Central Limit Theorem using block averages

---

## 📈 Key Results

- The raw data does **not** follow a normal distribution.
- A **Gamma distribution** provides a strong fit based on moment matching.
- Transforming the data via the Gamma CDF produces a near-uniform distribution.
- Applying the inverse normal CDF yields a standard normal variable.
- Sample means converge to normality as predicted by the CLT.

---

## 🧠 Concepts Demonstrated

- Probability distributions  
- Statistical inference  
- Method of moments  
- Distribution transformations  
- Central Limit Theorem  
- Simulation-based validation  

---

## 📁 Repository Structure

├── plots/ # Generated figures and visualizations
├── mystery.txt # Raw dataset
├── project.R # Full analysis script
├── prob335_project.pdf # Full, descriptive, and detailed report of the project
└── README.md # Project documentation

---

## 🛠️ Tools & Technologies

- **Language:** R  
- **Techniques:** Statistical modeling, simulation, data visualization  
- **Libraries:** Base R (stats, graphics)

---

## 🎯 Learning Outcomes

This project demonstrates the ability to:
- Analyze unknown data using principled statistical reasoning
- Translate theoretical probability into computational experiments
- Communicate findings clearly through visualizations and documentation
- Build reproducible, well-organized analytical workflows

---

## 📎 Notes

This repository is intended for educational and analytical purposes.  
It was developed as part of a university-level probability and statistics course.

