# STUDENT ACADEMIC RECORDS MANAGEMENT SYSTEM (Without reshape2)

# 1. Create Sample Student Data Frames

cse <- data.frame(
  Student_ID = c(101, 102),
  Name = c("Arun", "Meena"),
  Department = "CSE",
  Semester = c(5, 5),
  Math = c(85, 78),
  Physics = c(88, 74),
  Chemistry = c(80, 70)
)

ece <- data.frame(
  Student_ID = c(201, 202),
  Name = c("Kiran", "Divya"),
  Department = "ECE",
  Semester = c(5, 6),
  Math = c(75, 82),
  Physics = c(79, 85),
  Chemistry = c(72, 88)
)

it <- data.frame(
  Student_ID = c(301, 302),
  Name = c("Rahul", "Sneha"),
  Department = "IT",
  Semester = c(6, 6),
  Math = c(90, 86),
  Physics = c(92, 89),
  Chemistry = c(89, 84)
)

# 2. Display Structure
cat("Structure of CSE Data:\n")
str(cse)

# 3. Merge All Departments
all_students <- rbind(cse, ece, it)

cat("\nCombined Data:\n")
print(all_students)

# 4. Subject-wise Performance (Mean Marks)
cat("\nSubject-wise Average Marks:\n")
print(colMeans(all_students[, 5:7]))

# 5. Edit Specific Row and Column
all_students$Math[all_students$Student_ID == 101] <- 95
all_students$Semester <- all_students$Semester + 1

cat("\nUpdated Data:\n")
print(all_students)

# 6. Save to New CSV File
write.csv(all_students, "Updated_Student_Records.csv", row.names = FALSE)

cat("\nFile Saved Successfully!\n")