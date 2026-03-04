#CREATE VARIABLE WITH DATA TYPES
patient_id <- c(101, 102, 103, 104, 105)  # Numeric ID
age <- c(45, 60, 50, 38, 70)              # Numeric age
gender <- c("Male", "Female", "Male", "Female", "Male")  # Character gender
blood_pressure <- c(130, 150, 142, 135, 160)  # Numeric BP
diabetic <- c("Yes", "No", "Yes", "No", "Yes")  # Character diabetic status

#create a dataframe & convert categorical variables
# Combine into data frame
patients <- data.frame(patient_id, age, gender, blood_pressure, diabetic)

# Convert gender to factor
patients$gender <- factor(patients$gender)

# Convert diabetic status to factor
patients$diabetic <- factor(patients$diabetic)

patients

#identify high risk patients 
# Logical condition for high-risk patients
high_risk <- patients$blood_pressure > 140 & patients$diabetic == "Yes"

# Display high-risk patients
patients[high_risk, ]

#create a list to store 
# Create list containing mixed data types
hospital_list <- list(patient_id, age, gender, blood_pressure, diabetic)

hospital_list

#create array for multiple day BP reading
# Create 3-day BP readings for 5 patients
bp_array <- array(
  c(130,132,128, 150,148,152, 142,140,145, 135,138,136, 160,158,162),
  dim = c(5,3),
  dimnames = list(
    c("P1","P2","P3","P4","P5"),
    c("Day1","Day2","Day3")
  )
)

bp_array

# Calculate mean BP row-wise
rowMeans(bp_array)

# Find maximum BP value
max(bp_array)

# Calculate average blood pressure
mean(patients$blood_pressure)

# Calculate minimum blood pressure
min(patients$blood_pressure)

# Calculate standard deviation
sd(patients$blood_pressure)

# Calculate total of all BP readings
sum(patients$blood_pressure)