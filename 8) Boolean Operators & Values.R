# 15. Check whether a number lies between 10 and 50

num <- 35

if (num >= 10 & num <= 50) {
  cat("Using &: Number lies between 10 and 50\n")
} else {
  cat("Using &: Number does NOT lie between 10 and 50\n")
}

if (num < 10 | num > 50) {
  cat("Using |: Number is outside the range 10 to 50\n")
} else {
  cat("Using |: Number is inside the range 10 to 50\n")
}


# 16. Filter values in a vector that satisfy condition (greater than 10 and less than 50)

x <- c(5, 12, 25, 60, 45, 8, 30)

filtered_values <- x[x > 10 & x < 50]

cat("Filtered values (between 10 and 50):\n")
print(filtered_values)