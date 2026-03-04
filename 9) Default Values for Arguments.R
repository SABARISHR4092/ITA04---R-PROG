# 17. Function with Default Argument (Power Function)

power <- function(x, p = 2) {
  return(x^p)
}

# Calling function without p (default p = 2)
cat("Power with default p:", power(5), "\n")

# Calling function with custom p
cat("Power with given p:", power(5, 3), "\n")


# 18. Function with Default Discount Rate

discount <- function(price, rate = 0.10) {
  final_price <- price - (price * rate)
  return(final_price)
}

# Calling function without rate (default 10%)
cat("Final price with default discount:", discount(1000), "\n")

# Calling function with custom rate
cat("Final price with 20% discount:", discount(1000, 0.20), "\n")