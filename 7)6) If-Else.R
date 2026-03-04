#R Program to Check Whether a Number is Positive, Negative, or Zero
# Input number
num <- 10   # Change this value to test

# Check condition
if (num > 0) {
  cat("The number is Positive\n")
} else if (num < 0) {
  cat("The number is Negative\n")
} else {
  cat("The number is Zero\n")
}

#R Program to Assign Grades Using if-else
# Input marks
marks <- 85   # Change value to test

# Grade assignment
if (marks >= 90) {
  cat("Grade: A\n")
} else if (marks >= 75) {
  cat("Grade: B\n")
} else if (marks >= 60) {
  cat("Grade: C\n")
} else {
  cat("Grade: Fail\n")
}