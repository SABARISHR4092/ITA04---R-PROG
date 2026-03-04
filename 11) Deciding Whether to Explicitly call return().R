# 21. Function to check whether a number is prime
# Uses explicit return(FALSE) for early exit

is_prime <- function(n) {
  
  if (n <= 1) {
    return(FALSE)
  }
  
  for (i in 2:(n - 1)) {
    if (n %% i == 0) {
      return(FALSE)   # Early return if divisible
    }
  }
  
  return(TRUE)   # If no divisor found
}

cat("Is 7 prime?", is_prime(7), "\n")
cat("Is 8 prime?", is_prime(8), "\n")


# 22. Function to calculate average
# Returns "Invalid" if vector is empty

calculate_average <- function(x) {
  
  if (length(x) == 0) {
    return("Invalid")   # Explicit return for empty vector
  }
  
  avg <- sum(x) / length(x)
  return(avg)
}

cat("Average:", calculate_average(c(10, 20, 30)), "\n")
cat("Average of empty vector:", calculate_average(c()), "\n")