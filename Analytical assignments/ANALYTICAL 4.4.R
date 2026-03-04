# =====================================================
# STUDY HOURS AND ACADEMIC ACHIEVEMENT
# =====================================================

# Generate Sample Data for 200 Students
set.seed(123)

study_hours <- round(rnorm(200, mean = 5, sd = 2), 1)
study_hours[study_hours < 0] <- abs(study_hours[study_hours < 0])

# Assume exam score increases with study hoursq
exam_scores <- 40 + 8 * study_hours + rnorm(200, mean = 0, sd = 5)

data <- data.frame(study_hours, exam_scores)

# -----------------------------------------------------
# 1. Univariate EDA
# -----------------------------------------------------

cat("Summary - Study Hours\n")
print(summary(data$study_hours))
cat("\nSummary - Exam Scores\n")
print(summary(data$exam_scores))

# Histograms
hist(data$study_hours,
     main="Distribution of Study Hours",
     xlab="Study Hours",
     col="lightblue")

hist(data$exam_scores,
     main="Distribution of Exam Scores",
     xlab="Exam Scores",
     col="lightgreen")

# -----------------------------------------------------
# 2. Variance and Standard Deviation
# -----------------------------------------------------

cat("\nVariance & Standard Deviation\n")
cat("Study Hours Variance:", var(data$study_hours), "\n")
cat("Study Hours SD:", sd(data$study_hours), "\n\n")

cat("Exam Scores Variance:", var(data$exam_scores), "\n")
cat("Exam Scores SD:", sd(data$exam_scores), "\n\n")

# -----------------------------------------------------
# 3. Covariance and Correlation
# -----------------------------------------------------

cov_value <- cov(data$study_hours, data$exam_scores)
cor_value <- cor(data$study_hours, data$exam_scores)

cat("Covariance:", cov_value, "\n")
cat("Correlation:", cor_value, "\n\n")

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

plot(data$study_hours, data$exam_scores,
     main="Scatter Plot: Study Hours vs Exam Scores",
     xlab="Study Hours",
     ylab="Exam Scores",
     pch=19,
     col="blue")

abline(lm(exam_scores ~ study_hours, data=data),
       col="red", lwd=2)

# -----------------------------------------------------
# 5. Interpretation
# -----------------------------------------------------

cat("\nInterpretation:\n")
cat("Positive covariance and high positive correlation indicate that\n")
cat("students who study more hours tend to score higher marks.\n")