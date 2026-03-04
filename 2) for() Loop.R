# Print numbers from 1 to 10 and their squares

for (i in 1:10) {
  cat("Number:", i, " Square:", i^2, "\n")
}

#4. R Program to Find the Sum of Even Numbers from 1 to 50

# Initialize sum variable
sum_even <- 0

# Loop from 1 to 50
for (i in 1:50) {
  if (i %% 2 == 0) {      # Check if number is even
    sum_even <- sum_even + i
  }
}

# Print result
cat("Sum of even numbers from 1 to 50 is:", sum_even)