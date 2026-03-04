# 27. Demonstrating Pass-by-Value Behavior in R

modify_vector <- function(v) {
  v[1] <- 999   # Modify inside function
  print("Modified vector inside function:")
  print(v)
}

original_vector <- c(10, 20, 30, 40)

modify_vector(original_vector)

cat("Original vector outside function:\n")
print(original_vector)



# 28. Using <<- to Modify a Global Variable Inside a Function

global_var <- 100

modify_global <- function() {
  global_var <<- 500   # Super assignment operator
}

cat("Before modification:", global_var, "\n")

modify_global()

cat("After modification:", global_var, "\n")