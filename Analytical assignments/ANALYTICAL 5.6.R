# =====================================================
# ENVIRONMENTAL POLLUTION MONITORING
# =====================================================

set.seed(123)

# Generate Sample Data (365 Days)
n <- 365

day <- 1:n
PM25 <- round(rnorm(n, 80, 20),1)
temperature <- round(rnorm(n, 30, 5),1)
humidity <- round(runif(n, 40, 90),1)

# Respiratory Cases (Influenced by PM2.5 & Temperature)
resp_cases <- round(10 + 0.2*PM25 + 0.1*temperature +
                      rnorm(n,0,5))

region <- sample(c("North","South","East","West"),
                 n, replace=TRUE)

env_data <- data.frame(day, PM25, temperature,
                       humidity, resp_cases, region)

# -----------------------------------------------------
# 1. Histogram & Density Plot (Pollution)
# -----------------------------------------------------

hist(env_data$PM25,
     main="PM2.5 Distribution",
     xlab="PM2.5 Level",
     col="lightblue",
     probability=TRUE)

lines(density(env_data$PM25),
      col="red", lwd=2)

# -----------------------------------------------------
# 2. Line Chart (Trend Over Time)
# -----------------------------------------------------

plot(env_data$day, env_data$PM25,
     type="l",
     main="Daily PM2.5 Trend",
     xlab="Day",
     ylab="PM2.5 Level",
     col="darkgreen")

# -----------------------------------------------------
# 3. Multiple Linear Regression
# Predict Respiratory Cases
# -----------------------------------------------------

model <- lm(resp_cases ~ PM25 + temperature,
            data=env_data)

summary_model <- summary(model)
print(summary_model)

# -----------------------------------------------------
# 4. Interpretation Values
# -----------------------------------------------------

cat("\nIntercept:", coef(model)[1])
cat("\nPM2.5 Coefficient:", coef(model)[2])
cat("\nTemperature Coefficient:", coef(model)[3])
cat("\nR-squared:", summary_model$r.squared, "\n")

# -----------------------------------------------------
# 5. Lattice Graph (Region-wise Pollution)
# -----------------------------------------------------

install.packages("lattice")  # Run once
library(lattice)

bwplot(PM25 ~ region,
       data=env_data,
       col="blue",
       main="Region-wise PM2.5 Comparison")

# -----------------------------------------------------
# 6. Low-Level Customization Example
# -----------------------------------------------------

plot(env_data$PM25, env_data$resp_cases,
     type="n",
     main="PM2.5 vs Respiratory Cases",
     xlab="PM2.5 Level",
     ylab="Respiratory Cases")

points(env_data$PM25, env_data$resp_cases,
       col="purple", pch=16)

abline(lm(resp_cases ~ PM25, data=env_data),
       col="red", lwd=2)

axis(1)
axis(2)
box()

# -----------------------------------------------------
# 7. Save Visualizations
# -----------------------------------------------------

pdf("Environmental_Pollution_Report.pdf")

hist(env_data$PM25, probability=TRUE,
     col="lightblue",
     main="PM2.5 Distribution")
lines(density(env_data$PM25), col="red")

plot(env_data$day, env_data$PM25,
     type="l", col="darkgreen",
     main="PM2.5 Trend")

bwplot(PM25 ~ region, data=env_data)

plot(env_data$PM25, env_data$resp_cases,
     pch=16, col="purple",
     main="PM2.5 vs Respiratory Cases")
abline(lm(resp_cases ~ PM25, data=env_data),
       col="red")

dev.off()

cat("Public Health Report Saved Successfully!")