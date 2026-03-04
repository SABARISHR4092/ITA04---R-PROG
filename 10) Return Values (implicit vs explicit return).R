# 19. Function to return the largest of two numbers (Explicit return)

largest_number <- function(a, b) {
  if (a > b) {
    return(a)
  } else {
    return(b)
  }
}

cat("Largest number is:", largest_number(10, 25), "\n")


# 20. Function to return sum of a vector (Implicit return)

sum_vector <- function(x) {
  sum(x)   # Last evaluated expression is automatically returned
}

numbers <- c(5, 10, 15, 20)
cat("Sum of vector is:", sum_vector(numbers), "\n")