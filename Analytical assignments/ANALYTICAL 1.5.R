# BANK LOAN APPLICANT ANALYSIS

# Create vectors for each variable
age <- c(25, 40, 35, 28, 50)
income <- c(45000, 60000, 75000, 52000, 90000)
credit_score <- c(680, 720, 710, 690, 750)
employment_status <- c("Employed", "Self-Employed", "Employed", "Unemployed", "Employed")
loan_approval <- c("No", "Yes", "Yes", "No", "Yes")

# Create data frame
loan_data <- data.frame(age, income, credit_score, employment_status, loan_approval)

loan_data

# Convert categorical variables into factors
loan_data$employment_status <- factor(loan_data$employment_status)
loan_data$loan_approval <- factor(loan_data$loan_approval)

loan_data


# Logical condition: income > 50000 and credit_score > 700
eligible_applicants <- loan_data$income > 50000 & loan_data$credit_score > 700

eligible_applicants

# Display eligible applicants
loan_data[eligible_applicants, ]


# Create matrix of financial indicators (income and credit score)
financial_matrix <- as.matrix(loan_data[, c("income", "credit_score")])

financial_matrix

# Calculate column means
colMeans(financial_matrix)

# Matrix transpose
t(financial_matrix)

# Matrix multiplication example
financial_matrix %*% matrix(c(1,1), ncol=1)


# Define S4 class "LoanApplicant"
setClass(
  "LoanApplicant",
  slots = list(
    age = "numeric",
    income = "numeric",
    credit_score = "numeric",
    employment_status = "character",
    loan_approval = "character"
  )
)

# Create object of S4 class
applicant1 <- new("LoanApplicant",
                  age = 30,
                  income = 65000,
                  credit_score = 720,
                  employment_status = "Employed",
                  loan_approval = "Yes")

applicant1


# S3 is informal and flexible class system
# S4 is formal class system with defined slots and data validation
# Reference class supports object-oriented programming with mutable objects