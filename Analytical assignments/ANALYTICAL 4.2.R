# =====================================================
# GENDER-BASED ENROLLMENT ANALYSIS
# =====================================================

# Sample Dataset

Gender <- c("Male","Female","Male","Female","Male","Female",
            "Male","Female","Male","Female","Male","Female",
            "Male","Male","Female","Female","Male","Female",
            "Male","Female")

Course <- c("B.Tech","B.Tech","BBA","BBA","B.Sc","B.Sc",
            "B.Tech","B.Sc","BBA","B.Tech","B.Sc","BBA",
            "B.Tech","B.Sc","B.Tech","BBA","B.Tech","B.Sc",
            "BBA","B.Tech")

data <- data.frame(Gender, Course)

# -----------------------------------------------------
# 1. Crosstab (Contingency Table)
# -----------------------------------------------------

crosstab <- table(data$Gender, data$Course)

cat("Crosstab (Gender vs Course):\n")
print(crosstab)

# -----------------------------------------------------
# 2. Interpretation of Contingency Table
# -----------------------------------------------------

cat("\nRow-wise Percentage Distribution:\n")
print(prop.table(crosstab, margin = 1) * 100)

cat("\nColumn-wise Percentage Distribution:\n")
print(prop.table(crosstab, margin = 2) * 100)

# -----------------------------------------------------
# 3. Univariate EDA (Total Enrollment per Course)
# -----------------------------------------------------

course_total <- table(data$Course)

cat("\nTotal Enrollment per Course:\n")
print(course_total)

cat("\nPercentage Distribution per Course:\n")
print(prop.table(course_total) * 100)

# -----------------------------------------------------
# 4. Bar Charts for Graphical Analysis
# -----------------------------------------------------

# Bar Chart for Total Enrollment
barplot(course_total,
        main="Total Enrollment per Course",
        xlab="Course",
        ylab="Number of Students",
        col="lightblue")

# Stacked Bar Chart for Gender-wise Distribution
barplot(crosstab,
        beside=FALSE,
        legend=TRUE,
        main="Gender-wise Enrollment Distribution",
        col=c("pink","skyblue"))

# Side-by-Side Bar Chart
barplot(crosstab,
        beside=TRUE,
        legend=TRUE,
        main="Gender vs Course (Side-by-Side)",
        col=c("pink","skyblue"))

# -----------------------------------------------------
# 5. Explanation (Printed Output)
# -----------------------------------------------------

cat("\nExplanation:\n")
cat("1. Crosstab shows enrollment distribution between gender and courses.\n")
cat("2. Univariate EDA shows overall popularity of each course.\n")
cat("3. Bar charts visually represent categorical comparisons.\n")
cat("4. Quantitative EDA gives exact counts and percentages.\n")
cat("5. Graphical EDA helps quickly identify patterns and trends.\n")