# =====================================================
# ROAD ACCIDENT ANALYSIS USING COUNT DATA
# =====================================================

set.seed(123)

# Generate Sample Data (365 Days)
n <- 365

day <- 1:n
traffic_density <- round(runif(n, 50, 200),0)
weather <- sample(c("Sunny","Rainy","Foggy"), n, replace=TRUE)

# Generate Accident Counts using Poisson Distribution
lambda <- exp(-1 + 0.005*traffic_density +
                ifelse(weather=="Rainy",0.4,
                       ifelse(weather=="Foggy",0.6,0)))

accidents <- rpois(n, lambda)

road_data <- data.frame(day, traffic_density,
                        weather, accidents)

# -----------------------------------------------------
# 1. Bar Plot & Line Chart
# -----------------------------------------------------

# Bar Plot (Total accidents by weather)
weather_total <- tapply(road_data$accidents,
                        road_data$weather, sum)

barplot(weather_total,
        main="Total Accidents by Weather",
        col="orange",
        ylab="Number of Accidents")

# Line Chart (Daily Trend)
plot(road_data$day, road_data$accidents,
     type="l",
     main="Daily Accident Trend",
     xlab="Day",
     ylab="Accident Count",
     col="blue")

# -----------------------------------------------------
# 2. Poisson Regression
# -----------------------------------------------------

poisson_model <- glm(accidents ~ traffic_density + weather,
                     data=road_data,
                     family=poisson)

summary(poisson_model)

# -----------------------------------------------------
# 3. Interpret Coefficients (Odds Ratio Style)
# -----------------------------------------------------

exp_coef <- exp(coef(poisson_model))
print("Exponentiated Coefficients:")
print(exp_coef)

# -----------------------------------------------------
# 4. Compare with Linear Regression
# -----------------------------------------------------

linear_model <- lm(accidents ~ traffic_density + weather,
                   data=road_data)

summary(linear_model)

# -----------------------------------------------------
# 5. ggplot2 Visualization
# -----------------------------------------------------

install.packages("ggplot2")  # Run once
library(ggplot2)

ggplot(road_data, aes(x=weather, y=accidents,
                      fill=weather)) +
  geom_boxplot() +
  labs(title="Accident Frequency by Weather Condition")

# -----------------------------------------------------
# 6. Add Regression Line (Low-Level)
# -----------------------------------------------------

plot(road_data$traffic_density,
     road_data$accidents,
     main="Traffic Density vs Accidents",
     xlab="Traffic Density",
     ylab="Accident Count",
     pch=19, col="darkgreen")

abline(lm(accidents ~ traffic_density,
          data=road_data),
       col="red", lwd=2)

# -----------------------------------------------------
# 7. Save Graphs
# -----------------------------------------------------

pdf("Road_Accident_Analysis.pdf")

barplot(weather_total, col="orange",
        main="Total Accidents by Weather")

plot(road_data$day, road_data$accidents,
     type="l", col="blue",
     main="Daily Accident Trend")

plot(road_data$traffic_density,
     road_data$accidents,
     pch=19, col="darkgreen",
     main="Traffic Density vs Accidents")
abline(lm(accidents ~ traffic_density,
          data=road_data),
       col="red")

dev.off()

cat("PDF Saved Successfully!")