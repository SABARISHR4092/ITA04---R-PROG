#R program that prints numbers 1 to 20 but skips multiples of 3 using next
# Loop from 1 to 20
for (i in 1:20) {
  
  if (i %% 3 == 0) {
    next    # Skip multiples of 3
  }
  
  print(i)
}

# R program that scans a vector and stops when it finds a negative number using break.
# Create a vector
numbers <- c(10, 25, 8, 15, -5, 20, 30)

# Scan vector
for (num in numbers) {
  
  if (num < 0) {
    cat("Negative number found:", num, "\n")
    break   # Stop loop
  }
  
  print(num)
}

