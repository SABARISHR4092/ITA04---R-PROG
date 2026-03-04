# 29. Recursive function to compute factorial

factorial_recursive <- function(n) {
  
  if (n == 0 || n == 1) {
    return(1)   # Base condition
  }
  
  return(n * factorial_recursive(n - 1))
}

cat("Factorial of 5 is:", factorial_recursive(5), "\n")



# 30. Recursive function to compute Fibonacci

fibonacci_recursive <- function(n) {
  
  if (n == 0) {
    return(0)   # Base condition
  }
  
  if (n == 1) {
    return(1)   # Base condition
  }
  
  return(fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2))
}

cat("Fibonacci of 6 is:", fibonacci_recursive(6), "\n")