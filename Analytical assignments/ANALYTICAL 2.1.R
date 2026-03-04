# STUDENT RESULT PROCESSING SYSTEM

# Input marks matrix (rows = students, columns = subjects)
marks <- matrix(
  c(80,75,90,
    40,50,45,
    60,65,70,
    30,35,25),
  nrow = 4,
  byrow = TRUE
)

colnames(marks) <- c("Subject1","Subject2","Subject3")
rownames(marks) <- paste("Student",1:4)

# Initialize vectors
total_marks <- c()
grades <- c()

# For loop to calculate total marks
for(i in 1:nrow(marks)){
  total_marks[i] <- sum(marks[i, ])
}

# Calculate percentage using arithmetic operators
percentage <- (total_marks / 300) * 100

# Assign grades using if-else and boolean operators
for(i in 1:length(percentage)){
  
  if(percentage[i] >= 80){
    grades[i] <- "A"
    
  } else if(percentage[i] >= 60 & percentage[i] < 80){
    grades[i] <- "B"
    
  } else if(percentage[i] >= 40 & percentage[i] < 60){
    grades[i] <- "C"
    
  } else {
    grades[i] <- "Fail"
  }
}

# Identify failed students using logical condition
failed_students <- rownames(marks)[grades == "Fail"]

# Function with default argument to calculate percentage
calculate_percentage <- function(total, max_marks = 300){
  percent <- (total / max_marks) * 100
  return(percent)
}

# Function returning complex object (list)
student_result <- function(total, max_marks = 300){
  
  percent <- calculate_percentage(total, max_marks)
  
  if(percent >= 80){
    grade <- "A"
  } else if(percent >= 60){
    grade <- "B"
  } else if(percent >= 40){
    grade <- "C"
  } else {
    grade <- "Fail"
  }
  
  return(list(
    Total = total,
    Percentage = percent,
    Grade = grade
  ))
}

# Generate result summary for all students
results <- list()

for(i in 1:length(total_marks)){
  results[[i]] <- student_result(total_marks[i])
}

# Display outputs
marks
total_marks
percentage
grades
failed_students
results