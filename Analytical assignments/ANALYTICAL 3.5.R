# =====================================================
# ADVERTISEMENT SPENDING AND SALES RELATIONSHIP
# =====================================================

# Sample Monthly Data for 3 Years (36 Months)

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

cat("Summary of Advertisement Spending:\n")
print(summary(data$Advertisement))

cat("\nSummary of Sales Revenue:\n")
print(summary(data$Sales))

cat("\nStandard Deviation:\n")
cat("Advertisement SD:", sd(data$Advertisement), "\n")
cat("Sales SD:", sd(data$Sales), "\n")

# Histograms
hist(data$Advertisement, main="Advertisement Distribution",
     xlab="Advertisement Spending")

hist(data$Sales, main="Sales Distribution",
     xlab="Sales Revenue")


# -----------------------------------------------------
# 2. Covariance
# -----------------------------------------------------

cov_value <- cov(data$Advertisement, data$Sales)
cat("\nCovariance between Advertisement and Sales:\n")
print(cov_value)


# -----------------------------------------------------
# 3. Correlation Coefficient
# -----------------------------------------------------

cor_value <- cor(data$Advertisement, data$Sales)
cat("\nCorrelation Coefficient:\n")
print(cor_value)

if(cor_value > 0.7){
  cat("Strong Positive Relationship\n")
} else if(cor_value > 0.3){
  cat("Moderate Positive Relationship\n")
} else {
  cat("Weak Relationship\n")
}


# -----------------------------------------------------
# 4. Scatter Plot
# -----------------------------------------------------

plot(data$Advertisement, data$Sales,
     main="Scatter Plot: Advertisement vs Sales",
     xlab="Advertisement Spending",
     ylab="Sales Revenue",
     pch=19)

abline(lm(Sales ~ Advertisement, data=data), col="red")


# -----------------------------------------------------
# 5. Difference Between Covariance and Correlation
# -----------------------------------------------------

cat("\nDifference Explanation:\n")
cat("Covariance measures direction of relationship but is scale dependent.\n")
cat("Correlation measures strength and direction, and is standardized between -1 and +1.\n")