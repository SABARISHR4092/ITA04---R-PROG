# =====================================================
# EMPLOYEE PRODUCTIVITY ANALYSIS
# =====================================================

set.seed(123)

# Generate Sample Data (250 Employees)
n <- 250

experience <- round(runif(n, 1, 20),1)
training_hours <- round(runif(n, 10, 100),1)
working_hours <- round(runif(n, 6, 10),1)

# Productivity Score (Simulated)
productivity <- round(50 + 2*experience + 0.5*training_hours +
                        rnorm(n,0,10),1)

department <- sample(c("HR","IT","Sales","Finance"),
                     n, replace=TRUE)

emp_data <- data.frame(experience, training_hours,
                       working_hours, productivity, department)

# -----------------------------------------------------
# 1. Histogram & Boxplot (Productivity)
# -----------------------------------------------------

hist(emp_data$productivity,
     main="Productivity Distribution",
     xlab="Productivity Score",
     col="lightblue",
     border="black")

boxplot(emp_data$productivity,
        main="Boxplot of Productivity",
        col="orange",
        horizontal=TRUE)

# -----------------------------------------------------
# 2. Scatter Plot (Experience vs Productivity)
# -----------------------------------------------------

plot(emp_data$experience, emp_data$productivity,
     main="Experience vs Productivity",
     xlab="Experience (Years)",
     ylab="Productivity Score",
     col="blue",
     pch=19)

# Add regression line (low-level function)
abline(lm(productivity ~ experience, data=emp_data),
       col="red", lwd=2)

# -----------------------------------------------------
# 3. Multiple Linear Regression
# Predict Productivity using Experience & Training
# -----------------------------------------------------

model <- lm(productivity ~ experience + training_hours,
            data=emp_data)

summary_model <- summary(model)
print(summary_model)

# -----------------------------------------------------
# 4. Interpretation (Printed)
# -----------------------------------------------------

cat("\nIntercept:", coef(model)[1])
cat("\nExperience Coefficient:", coef(model)[2])
cat("\nTraining Coefficient:", coef(model)[3])
cat("\nR-squared:", summary_model$r.squared, "\n")

# -----------------------------------------------------
# 5. Lattice Graphics (Department-wise Comparison)
# -----------------------------------------------------

install.packages("lattice")  # Run once
library(lattice)

bwplot(productivity ~ department,
       data=emp_data,
       col="green",
       main="Department-wise Productivity Comparison")

# -----------------------------------------------------
# 6. Low-Level Customization Example
# -----------------------------------------------------

plot(emp_data$training_hours, emp_data$productivity,
     type="n",
     main="Customized Training vs Productivity",
     xlab="Training Hours",
     ylab="Productivity")

points(emp_data$training_hours, emp_data$productivity,
       col="purple", pch=16)

axis(1, at=seq(0,100,20))
axis(2)
box()

# -----------------------------------------------------
# 7. Save Plots in PDF
# -----------------------------------------------------

pdf("Employee_Productivity_Plots.pdf")

hist(emp_data$productivity, col="lightblue",
     main="Productivity Distribution")

boxplot(emp_data$productivity, col="orange",
        main="Productivity Boxplot")

plot(emp_data$experience, emp_data$productivity,
     col="blue", pch=19,
     main="Experience vs Productivity")
abline(lm(productivity ~ experience, data=emp_data),
       col="red")

bwplot(productivity ~ department, data=emp_data)

dev.off()

cat("PDF File Saved Successfully!")