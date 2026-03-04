# HOSPITAL PATIENT DATA ANALYSIS SYSTEM

# 1. Create Admission Data Frame
admission_data <- data.frame(
  Patient_ID = c(1, 2, 3, 4),
  Name = c("Arun", "Meena", "Rahul", "Divya"),
  Age = c(45, 30, 50, 28),
  Diagnosis = c("Diabetes", "Fever", "Heart", "Asthma")
)

# Create Billing Data Frame
billing_data <- data.frame(
  Patient_ID = c(1, 2, 3, 4),
  Treatment = c("Insulin", "Medication", "Surgery", "Inhaler"),
  Treatment_Cost = c(5000, 2000, 15000, 3000)
)


# 2. Merge Admission and Billing Data using Patient_ID
hospital_data <- merge(admission_data, billing_data, by = "Patient_ID")

cat("Merged Hospital Data:\n")
print(hospital_data)


# 3. Reshaping Data (Wide to Long and Long to Wide)

# Create Wide Format Example (Multiple Costs)
hospital_data$Lab_Cost <- c(1000, 500, 3000, 700)
hospital_data$Medicine_Cost <- c(1500, 800, 4000, 900)

cat("\nWide Format Data:\n")
print(hospital_data)

# Convert Wide → Long using base R (stack)
long_data <- stack(hospital_data[, c("Treatment_Cost", "Lab_Cost", "Medicine_Cost")])
long_data$Patient_ID <- rep(hospital_data$Patient_ID, 3)

cat("\nLong Format Data:\n")
print(long_data)

# Long → Wide using reshape
wide_data <- reshape(
  long_data,
  idvar = "Patient_ID",
  timevar = "ind",
  direction = "wide"
)

cat("\nConverted Back to Wide Format:\n")
print(wide_data)


# 4. Filter and Edit Records

# Filter patients with treatment cost > 4000
high_cost_patients <- hospital_data[hospital_data$Treatment_Cost > 4000, ]

cat("\nHigh Cost Patients:\n")
print(high_cost_patients)

# Update treatment cost for Patient_ID 2
hospital_data$Treatment_Cost[hospital_data$Patient_ID == 2] <- 2500

cat("\nUpdated Hospital Data:\n")
print(hospital_data)


# 5. Write Processed Data to New CSV File
write.csv(hospital_data, "Processed_Hospital_Report.csv", row.names = FALSE)

cat("\nProcessed data saved as 'Processed_Hospital_Report.csv'\n")


# Example: Reading from CSV (if file exists)
# read_data <- read.csv("hospital_data.csv")
# str(read_data)