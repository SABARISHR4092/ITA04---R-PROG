# =====================================================
# HEALTHCARE DATA AND DISEASE RISK ANALYSIS
# =====================================================

set.seed(123)

# Generate Sample Data (200 Patients)
n <- 200

age <- sample(20:70, n, replace = TRUE)
BMI <- round(rnorm(n, 25, 4), 1)
blood_pressure <- round(90 + 0.5*age + 0.8*BMI + rnorm(n, 0, 5), 1)

# Disease Probability (Logistic Model Simulation)
prob_disease <- 1 / (1 + exp(-(-8 + 0.05*age + 0.1*BMI)))
disease <- ifelse(runif(n) < prob_disease, "Yes", "No")

health_data <- data.frame(age, BMI, blood_pressure, disease)

# -----------------------------------------------------
# 1. Histogram and Boxplot (BMI)
# -----------------------------------------------------

hist(health_data$BMI,
     main="BMI Distribution",
     xlab="BMI",
     col="lightblue")

boxplot(health_data$BMI,
        main="Boxplot of BMI",
        col="orange")

# -----------------------------------------------------
# 2. Scatter Plot (Age vs Blood Pressure)
# -----------------------------------------------------

plot(health_data$age, health_data$blood_pressure,
     main="Age vs Blood Pressure",
     xlab="Age",
     ylab="Blood Pressure",
     col="blue",
     pch=19)

# -----------------------------------------------------
# 3. Multiple Linear Regression
# Predict Blood Pressure using Age & BMI
# -----------------------------------------------------

linear_model <- lm(blood_pressure ~ age + BMI, data=health_data)
summary(linear_model)

# -----------------------------------------------------
# 4. Logistic Regression
# Predict Disease (Yes/No)
# -----------------------------------------------------

health_data$disease_binary <- ifelse(health_data$disease=="Yes",1,0)

logistic_model <- glm(disease_binary ~ age + BMI,
                      data=health_data,
                      family=binomial)

summary(logistic_model)

# -----------------------------------------------------
# 5. Odds Ratios
# -----------------------------------------------------

odds_ratios <- exp(coef(logistic_model))
print("Odds Ratios:")
print(odds_ratios)

# -----------------------------------------------------
# 6. Advanced Visualization using ggplot2
# -----------------------------------------------------

install.packages("ggplot2")  # Run once if not installed
library(ggplot2)

ggplot(health_data, aes(x=BMI, fill=disease)) +
  geom_histogram(alpha=0.6, position="identity", bins=20) +
  labs(title="BMI Distribution by Disease Status")

ggplot(health_data, aes(x=age, y=blood_pressure, color=disease)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  labs(title="Age vs Blood Pressure by Disease")

# -----------------------------------------------------
# 7. Save Graphs
# -----------------------------------------------------

png("BMI_Histogram.png")
hist(health_data$BMI, col="lightblue")
dev.off()

png("Age_BP_Scatter.png")
plot(health_data$age, health_data$blood_pressure)
dev.off()

cat("Graphs Saved Successfully!")