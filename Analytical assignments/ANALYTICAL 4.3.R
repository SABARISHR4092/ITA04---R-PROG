# =====================================================
# ANNUAL TEMPERATURE TREND STUDY
# =====================================================

# Generate Sample Daily Temperature Data for 365 Days
set.seed(123)

temperature <- rnorm(365, mean = 28, sd = 5)

# -----------------------------------------------------
# 1. Mean, Median, Mode
# -----------------------------------------------------

mean_temp <- mean(temperature)
median_temp <- median(temperature)

# Mode function (for numeric data - approximate)
mode_temp <- as.numeric(names(sort(table(round(temperature,1)),
                                   decreasing = TRUE)[1]))

cat("Mean Temperature:", mean_temp, "\n")
cat("Median Temperature:", median_temp, "\n")
cat("Mode Temperature (Approx):", mode_temp, "\n\n")


# -----------------------------------------------------
# 2. Min, Max, Range, Variance, SD
# -----------------------------------------------------

min_temp <- min(temperature)
max_temp <- max(temperature)
range_temp <- max_temp - min_temp
variance_temp <- var(temperature)
sd_temp <- sd(temperature)

cat("Minimum Temperature:", min_temp, "\n")
cat("Maximum Temperature:", max_temp, "\n")
cat("Range:", range_temp, "\n")
cat("Variance:", variance_temp, "\n")
cat("Standard Deviation:", sd_temp, "\n\n")


# -----------------------------------------------------
# 3. Quartiles & Interquartile Range (IQR)
# -----------------------------------------------------

quartiles <- quantile(temperature)
iqr_temp <- IQR(temperature)

cat("Quartiles:\n")
print(quartiles)
cat("Interquartile Range (IQR):", iqr_temp, "\n\n")


# -----------------------------------------------------
# 4. Skewness and Kurtosis (Manual Calculation)
# -----------------------------------------------------

n <- length(temperature)
mean_val <- mean(temperature)
sd_val <- sd(temperature)

skewness <- sum((temperature - mean_val)^3) / ((n - 1) * sd_val^3)
kurtosis <- sum((temperature - mean_val)^4) / ((n - 1) * sd_val^4)

cat("Skewness:", skewness, "\n")
cat("Kurtosis:", kurtosis, "\n\n")

if(skewness > 0){
  cat("Distribution is Positively Skewed\n")
} else if(skewness < 0){
  cat("Distribution is Negatively Skewed\n")
} else {
  cat("Distribution is Symmetric\n")
}

if(kurtosis > 3){
  cat("Leptokurtic (Heavy Tails)\n")
} else if(kurtosis < 3){
  cat("Platykurtic (Light Tails)\n")
} else {
  cat("Mesokurtic (Normal Distribution)\n")
}


# -----------------------------------------------------
# 5. Histogram and Density Plot
# -----------------------------------------------------

hist(temperature,
     probability = TRUE,
     main = "Histogram of Daily Temperature",
     xlab = "Temperature",
     col = "lightblue")

lines(density(temperature), col = "red", lwd = 2)

# Separate Density Plot
plot(density(temperature),
     main = "Density Plot of Temperature",
     col = "blue",
     lwd = 2)