# 25. Assign a function to a variable and call it

f <- function(x) {
  x * 2
}

cat("Result of f(5):", f(5), "\n")


# 26. Function that accepts another function as argument 
# and applies it to a vector

apply_function <- function(func, vec) {
  return(func(vec))
}

# Example function to pass
square_function <- function(x) {
  x^2
}

numbers <- c(1, 2, 3, 4, 5)

result <- apply_function(square_function, numbers)

cat("Result after applying function:\n")
print(result)