# =====================================================
# MARKETING CAMPAIGN EFFECTIVENESS
# =====================================================

set.seed(123)

# Generate Sample Data (300 Customers)
n <- 300

advertising_cost <- round(runif(n, 1000, 10000),0)

# Customer Reach (continuous outcome)
customer_reach <- round(200 + 0.05*advertising_cost +
                          rnorm(n,0,50),0)

# Purchase Conversion Probability (Logistic Simulation)
prob_conversion <- 1 / (1 + exp(-(-5 + 0.0004*advertising_cost)))

conversion <- ifelse(runif(n) < prob_conversion,
                     "Yes","No")

marketing_data <- data.frame(advertising_cost,
                             customer_reach,
                             conversion)

# -----------------------------------------------------
# 1. Histogram & Scatter Plot
# -----------------------------------------------------

hist(marketing_data$advertising_cost,
     main="Advertising Cost Distribution",
     xlab="Advertising Cost",
     col="lightblue")

plot(marketing_data$advertising_cost,
     marketing_data$customer_reach,
     main="Advertising Cost vs Customer Reach",
     xlab="Advertising Cost",
     ylab="Customer Reach",
     col="blue", pch=19)

# -----------------------------------------------------
# 2. Simple Linear Regression
# -----------------------------------------------------

linear_model <- lm(customer_reach ~ advertising_cost,
                   data=marketing_data)

summary(linear_model)

# Add regression line
abline(linear_model, col="red", lwd=2)

# -----------------------------------------------------
# 3. Logistic Regression
# -----------------------------------------------------

marketing_data$conv_binary <-
  ifelse(marketing_data$conversion=="Yes",1,0)

logistic_model <- glm(conv_binary ~ advertising_cost,
                      data=marketing_data,
                      family=binomial)

summary(logistic_model)

# -----------------------------------------------------
# 4. Odds Ratio & Probability
# -----------------------------------------------------

exp_coef <- exp(coef(logistic_model))
print("Odds Ratio:")
print(exp_coef)

# Predicted Probability Example
new_data <- data.frame(advertising_cost=5000)
pred_prob <- predict(logistic_model,
                     new_data,
                     type="response")

cat("Predicted Conversion Probability at 5000 cost:",
    pred_prob, "\n")

# -----------------------------------------------------
# 5. Advanced Visualization using ggplot2
# -----------------------------------------------------

install.packages("ggplot2")   # Run once
library(ggplot2)

ggplot(marketing_data,
       aes(x=advertising_cost,
           y=customer_reach)) +
  geom_point(color="blue") +
  geom_smooth(method="lm", se=FALSE,
              color="red") +
  labs(title="Ad Cost vs Customer Reach")

ggplot(marketing_data,
       aes(x=advertising_cost,
           fill=conversion)) +
  geom_histogram(alpha=0.6,
                 position="identity",
                 bins=20) +
  labs(title="Advertising Cost by Conversion")

# -----------------------------------------------------
# 6. Save Graphs as PNG
# -----------------------------------------------------

png("AdCost_Histogram.png")
hist(marketing_data$advertising_cost,
     col="lightblue",
     main="Advertising Cost Distribution")
dev.off()

png("AdCost_vs_Reach.png")
plot(marketing_data$advertising_cost,
     marketing_data$customer_reach,
     col="blue", pch=19)
abline(linear_model, col="red")
dev.off()

cat("PNG Files Saved Successfully!")