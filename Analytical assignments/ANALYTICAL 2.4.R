# FACTORIAL AND FIBONACCI CALCULATOR

# 1️⃣ Factorial using for loop (iterative approach)
factorial_loop <- function(n){
  
  if(n < 0){
    return("Factorial not defined for negative numbers")
  }
  
  result <- 1
  
  for(i in 1:n){
    result <- result * i
  }
  
  return(result)
}

# Example
factorial_loop(5)


# 2️⃣ Factorial using recursion
factorial_recursive <- function(n){
  
  # Base condition
  if(n == 0 || n == 1){
    return(1)
  }
  
  # Recursive call
  return(n * factorial_recursive(n - 1))
}

# Example
factorial_recursive(5)


# 3️⃣ Fibonacci using recursion
fibonacci_recursive <- function(n){
  
  # Base conditions
  if(n == 0){
    return(0)
  }
  if(n == 1){
    return(1)
  }
  
  # Recursive calls
  return(fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2))
}

# Example
fibonacci_recursive(6)


# 4️⃣ Repeated calculation using repeat loop
repeat{
  
  num <- 5
  
  cat("Factorial (Loop):", factorial_loop(num), "\n")
  cat("Factorial (Recursive):", factorial_recursive(num), "\n")
  cat("Fibonacci:", fibonacci_recursive(num), "\n")
  
  break
}