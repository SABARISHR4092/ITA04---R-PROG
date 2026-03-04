# ==============================================
# EMPLOYEE PAYROLL MANAGEMENT SYSTEM
# ==============================================

# ------------------------------------------------
# 1. Create Payroll Data Frame Manually
# ------------------------------------------------

payroll <- data.frame(
  Employee_ID = c(1, 2, 3, 4),
  Department = c("HR", "IT", "Finance", "IT"),
  Salary = c(40000, 60000, 55000, 65000),
  Bonus = c(5000, 7000, 6000, 8000),
  Tax_Deduction = c(4000, 6000, 5000, 6500)
)

cat("Initial Payroll Data:\n")
print(payroll)


# ------------------------------------------------
# 2. Read Payroll Data from External Files
# ------------------------------------------------

# Reading from CSV file
# payroll <- read.csv("payroll.csv")

# Reading from Text file
# payroll_txt <- read.table("payroll.txt", header = TRUE)

# Reading from Excel (Requires readxl package)
# install.packages("readxl")
# library(readxl)
# payroll_excel <- read_excel("payroll.xlsx")


# ------------------------------------------------
# 3. Reshape Payroll Data (Wide → Long and Summary)
# ------------------------------------------------

# Convert Salary, Bonus, Tax into Long Format
long_payroll <- stack(payroll[, c("Salary", "Bonus", "Tax_Deduction")])
long_payroll$Employee_ID <- rep(payroll$Employee_ID, 3)
long_payroll$Department <- rep(payroll$Department, 3)

colnames(long_payroll) <- c("Amount", "Component", "Employee_ID", "Department")

cat("\nLong Format Payroll Data:\n")
print(long_payroll)

# Department-wise Salary Distribution
dept_summary <- aggregate(Salary ~ Department,
                          data = payroll,
                          mean)

cat("\nDepartment-wise Average Salary:\n")
print(dept_summary)


# ------------------------------------------------
# 4. Edit Salary or Bonus Values
# ------------------------------------------------

# Increase Salary of IT department by 10%
payroll$Salary[payroll$Department == "IT"] <-
  payroll$Salary[payroll$Department == "IT"] * 1.10

cat("\nUpdated Payroll Data (After Salary Increase):\n")
print(payroll)


# ------------------------------------------------
# 5. Merge Payroll with Employee Details
# ------------------------------------------------

employee_details <- data.frame(
  Employee_ID = c(1, 2, 3, 4),
  Employee_Name = c("Arun", "Meena", "Rahul", "Divya"),
  Location = c("Chennai", "Bangalore", "Mumbai", "Delhi")
)

merged_payroll <- merge(payroll, employee_details, by = "Employee_ID")

cat("\nMerged Payroll Data with Employee Details:\n")
print(merged_payroll)


# ------------------------------------------------
# 6. Export Final Payroll Report
# ------------------------------------------------

write.csv(merged_payroll,
          "Final_Payroll_Report.csv",
          row.names = FALSE)

cat("\nFinal Payroll Report Saved Successfully!\n")