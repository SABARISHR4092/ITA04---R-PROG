# =====================================================
# CUSTOMER PURCHASE PATTERN ANALYSIS
# =====================================================

# Generate Sample Data for 1000 Customers
set.seed(123)

items_purchased <- rpois(1000, lambda = 5) + 1

# Assume bill amount increases with number of items
total_bill <- 200 + 150 * items_purchased + rnorm(1000, mean = 0, sd = 200)

data <- data.frame(items_purchased, total_bill)

# -----------------------------------------------------
# 1. Univariate EDA for Total Bill
# -----------------------------------------------------

cat("Summary Statistics - Total Bill\n")
print(summary(data$total_bill))

# Histogram
hist(data$total_bill,
     probability = TRUE,
     main = "Histogram of Total Bill Amount",
     xlab = "Total Bill Amount",
     col = "lightblue")

lines(density(data$total_bill), col = "red", lwd = 2)

# -----------------------------------------------------
# 2. Measures of Dispersion
# -----------------------------------------------------

range_bill <- max(data$total_bill) - min(data$total_bill)
variance_bill <- var(data$total_bill)
sd_bill <- sd(data$total_bill)

cat("\nRange:", range_bill, "\n")
cat("Variance:", variance_bill, "\n")
cat("Standard Deviation:", sd_bill, "\n")

# -----------------------------------------------------
# 3. Skewness and Kurtosis (Manual Calculation)
# -----------------------------------------------------

n <- length(data$total_bill)
mean_val <- mean(data$total_bill)
sd_val <- sd(data$total_bill)

skewness <- sum((data$total_bill - mean_val)^3) / ((n - 1) * sd_val^3)
kurtosis <- sum((data$total_bill - mean_val)^4) / ((n - 1) * sd_val^4)

cat("\nSkewness:", skewness, "\n")
cat("Kurtosis:", kurtosis, "\n")

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
# 4. Covariance and Correlation
# -----------------------------------------------------

cov_value <- cov(data$items_purchased, data$total_bill)
cor_value <- cor(data$items_purchased, data$total_bill)

cat("\nCovariance:", cov_value, "\n")
cat("Correlation:", cor_value, "\n")

if(cor_value > 0.7){
  cat("Strong Positive Relationship\n")
} else if(cor_value > 0.3){
  cat("Moderate Positive Relationship\n")
} else {
  cat("Weak Relationship\n")
}

# -----------------------------------------------------
# 5. Scatter Plot
# -----------------------------------------------------

plot(data$items_purchased, data$total_bill,
     main = "Scatter Plot: Items Purchased vs Total Bill",
     xlab = "Number of Items Purchased",
     ylab = "Total Bill Amount",
     pch = 19,
     col = "blue")

abline(lm(total_bill ~ items_purchased, data=data),
       col = "red", lwd = 2)

# -----------------------------------------------------
# 6. Explanation
# -----------------------------------------------------

cat("\nDifference Between Univariate and Bivariate EDA:\n")
cat("Univariate EDA analyzes one variable at a time (e.g., total bill).\n")
cat("Bivariate EDA analyzes relationship between two variables (items and bill).\n")
cat("Here, univariate shows distribution and variability of bill amount,\n")
cat("while bivariate shows how number of items influences total spending.\n")