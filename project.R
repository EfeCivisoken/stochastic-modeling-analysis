###############################################################
#              MATH 335 — Mystery Distribution Project
#                     FINAL VERIFIED SCRIPT
###############################################################

###############################################################
# 0. WORKING DIRECTORY
###############################################################

setwd("/home/efe_r/prob335/")

# Create folder for plots (no error if exists)
dir.create("plots", showWarnings = FALSE)

# Enable x11 graphics on Linux (important for VS Code)
options(device = "x11")


###############################################################
# 1. LOAD DATA
###############################################################

mydata = read.table("mystery.txt", header = TRUE)
x = mydata$x


###############################################################
# 2. HISTOGRAM OF RAW DATA
###############################################################

x11()
hist(x, main="Histogram of Mystery Data", col="lightblue", breaks=50)

png("plots/hist_x.png")
hist(x, main="Histogram of Mystery Data", col="lightblue", breaks=50)
dev.off()


###############################################################
# 3. DESCRIPTIVE STATISTICS
###############################################################

mu = mean(x)
variance = var(x)
sd_x = sd(x)

print(mu)        # should be 13.99748
print(variance)  # should be 27.95732
print(sd_x)      # should be 5.287468


###############################################################
# 4. NORMALITY CHECK (Q–Q Plot)
###############################################################

x11()
qqnorm(x, main="Q-Q Plot for Normality")
qqline(x, col="red")

png("plots/qqnorm_x.png")
qqnorm(x, main="Q-Q Plot for Normality")
qqline(x, col="red")
dev.off()


###############################################################
# 5. EXPONENTIAL CHECK (λ = 1/μ)
###############################################################

lambda = 1 / mu
theoretical_var_exp = 1 / (lambda^2)

print(variance)            # sample variance (~27.95732)
print(theoretical_var_exp) # exponential variance (~195.9295)


###############################################################
# 6. GAMMA PARAMETER ESTIMATION (METHOD OF MOMENTS)
###############################################################

beta = mu / variance          # RATE parameter
alpha = beta * mu             # SHAPE parameter

print(alpha)  # should be 7.008167
print(beta)   # should be 0.5006733


###############################################################
# 7. GAMMA TRANSFORMATION TEST (Should be Uniform)
###############################################################

z = pgamma(x, shape = alpha, rate = beta)

x11()
hist(z, breaks=50, col="lightgreen",
     main="Gamma Transformation Test (Uniform?)")

png("plots/gamma_transform.png")
hist(z, breaks=50, col="lightgreen",
     main="Gamma Transformation Test (Uniform?)")
dev.off()


###############################################################
# 8. EXPONENTIAL TRANSFORMATION TEST (Should FAIL)
###############################################################

w = pexp(x, rate = lambda)

x11()
hist(w, breaks=50, col="lightpink",
     main="Exponential Transformation Test (Uniform?)")

png("plots/exp_transform.png")
hist(w, breaks=50, col="lightpink",
     main="Exponential Transformation Test (Uniform?)")
dev.off()


###############################################################
# 9. TRANSFORM TO STANDARD NORMAL USING GAMMA FIT
###############################################################

v = qnorm(z)   # theoretical inverse CDF (Φ⁻¹)

x11()
hist(v, breaks=50, col="purple",
     main="Histogram of v = qnorm(z)")

png("plots/hist_v.png")
hist(v, breaks=50, col="purple",
     main="Histogram of v = qnorm(z)")
dev.off()

x11()
qqnorm(v, main="Q-Q Plot for v (Should Be Normal)")
qqline(v, col="red")

png("plots/qqnorm_v.png")
qqnorm(v, main="Q-Q Plot for v (Should Be Normal)")
qqline(v, col="red")
dev.off()


###############################################################
# 9B. PURE RANDOM NORMAL SAMPLE (rnorm) — REQUIRED BY PROFESSOR
###############################################################

rand = rnorm(1000)

print(mean(rand))  # ~0
print(sd(rand))    # ~1

x11()
hist(rand, breaks=50, col="orange",
     main="Histogram of rand = rnorm(1000)")

png("plots/hist_rand.png")
hist(rand, breaks=50, col="orange",
     main="Histogram of rand = rnorm(1000)")
dev.off()

x11()
qqnorm(rand, main="Q-Q Plot for rnorm-generated sample")
qqline(rand, col="blue")

png("plots/qqnorm_rand.png")
qqnorm(rand, main="Q-Q Plot for rnorm-generated sample")
qqline(rand, col="blue")
dev.off()


###############################################################
# 10. LINEAR TRANSFORMATION USING v (THE PROJECT REQUIREMENT)
#     Build N(μ, σ²) USING THE STANDARD NORMAL FROM SECTION 9.
###############################################################

mu1 = mu      # must match mystery data mean (~14)
sigma1 = sd_x # must match mystery data sd (~5.29)

# Build Normal(mu1, sigma1^2)
s = mu1 + sigma1 * v

x11()
hist(s, breaks=50, col="gold",
     main="Generated Normal Distribution Using v")

png("plots/hist_s.png")
hist(s, breaks=50, col="gold",
     main="Generated Normal Distribution Using v")
dev.off()

print(mean(s))   # ~13.99735
print(sd(s))     # ~5.287952

lower_3sd = mu1 - 3*sigma1
upper_3sd = mu1 + 3*sigma1
prop_within_3sd = mean(s > lower_3sd & s < upper_3sd)

print(prop_within_3sd)  # ~0.997362


###############################################################
# 11. CENTRAL LIMIT THEOREM DEMONSTRATION
###############################################################

n = length(x)
group_size = 1000
num_groups = n / group_size

xbar = rep(NA, num_groups)

start_index = 1
for (j in 1:num_groups) {
  end_index = start_index + group_size - 1
  xbar[j] = mean(x[start_index:end_index])
  start_index = end_index + 1
}

x11()
hist(xbar, breaks=50, col="cyan",
     main="Histogram of Block Means (CLT)")

png("plots/hist_xbar.png")
hist(xbar, breaks=50, col="cyan",
     main="Histogram of Block Means (CLT)")
dev.off()

x11()
qqnorm(xbar, main="Q-Q Plot of Block Means (CLT)")
qqline(xbar, col="red")

png("plots/qqnorm_xbar.png")
qqnorm(xbar, main="Q-Q Plot of Block Means (CLT)")
qqline(xbar, col="red")
dev.off()

print(mean(xbar))          # ~13.99748
print(var(xbar))           # ~0.02771667

print(mu)                  # ~13.99748
print(variance / 1000)     # ~0.02795732


###############################################################
# END OF SCRIPT
###############################################################
