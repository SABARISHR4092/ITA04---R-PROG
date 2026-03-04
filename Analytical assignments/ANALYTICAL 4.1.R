# =====================================================
# ADVERTISEMENT SPENDING AND SALES RELATIONSHIP
# =====================================================

# Monthly Data for 3 Years (36 Observations)

Advertisement <- c(20,22,25,30,28,35,40,38,45,50,48,55,
                   23,26,27,32,30,36,42,39,46,52,49,58,
                   24,28,29,33,31,37,43,41,47,53,51,60)

Sales <- c(200,210,230,260,250,280,310,300,340,370,360,400,
           215,240,245,270,265,290,320,310,350,380,370,420,
           220,250,255,275,270,295,330,315,360,390,375,430)

data <- data.frame(Advertisement, Sales)

# -----------------------------------------------------
# 1. Univariate EDA
# -----------------------------------------------------

cat("Summary Statistics - Advertisement\n")
print(summary(data$Advertisement))
cat("Standard Deviation:", sd(data$Advertisement), "\n\n")

cat("Summary Statistics - Sales\n")
print(summary(data$Sales))
cat("Standard Deviation:", sd(data$Sales), "\n\n")

# Histograms
hist(data$Advertisement,
     main="Advertisement Spending Distribution",
     xlab="Advertisement Spending",
     col="lightblue")

hist(data$Sales,
     main="Sales Revenue Distribution",
     xlab="Sales Revenue",
     col="lightgreen")


# -----------------------------------------------------
# 2. Covariance
# -----------------------------------------------------

covariance_value <- cov(data$Advertisement, data$Sales)
cat("Covariance between Advertisement and Sales:\n")
print(covariance_value)


# -----------------------------------------------------
# 3. Correlation Coefficient
# -----------------------------------------------------

correlation_value <- cor(data$Advertisement, data$Sales)
cat("Correlation Coefficient:\n")
print(correlation_value)

if(correlation_value > 0.7){
  cat("Interpretation: Strong Positive Relationship\n")
} else if(correlation_value > 0.3){
  cat("Interpretation: Moderate Positive Relationship\n")
} else {
  cat("Interpretation: Weak Relationship\n")
}


# -----------------------------------------------------
# 4. Scatter Plot
# -----------------------------------------------------

plot(data$Advertisement, data$Sales,
     main="Scatter Plot: Advertisement vs Sales",
     xlab="Advertisement Spending",
     ylab="Sales Revenue",
     pch=19,
     col="blue")

abline(lm(Sales ~ Advertisement, data=data), col="red", lwd=2)


# -----------------------------------------------------
# 5. Covariance vs Correlation Explanation
# -----------------------------------------------------

cat("\nDifference Between Covariance and Correlation:\n")
cat("1. Covariance shows direction of relationship (positive/negative).\n")
cat("2. Covariance value depends on units of measurement.\n")
cat("3. Correlation shows both strength and direction.\n")
cat("4. Correlation is standardized between -1 and +1.\n")
cat("5. In this dataset, positive covariance and high positive correlation indicate that higher advertisement spending leads to higher sales.\n")