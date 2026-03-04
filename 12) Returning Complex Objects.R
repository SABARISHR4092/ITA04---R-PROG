# 23. Function to return mean and standard deviation as a list

calculate_stats <- function(x) {
  
  mean_value <- mean(x)
  sd_value <- sd(x)
  
  return(list(
    Mean = mean_value,
    Standard_Deviation = sd_value
  ))
}

result1 <- calculate_stats(c(10, 20, 30, 40, 50))
print(result1)


# 24. Function to return min, max, and range as a named list

range_stats <- function(x) {
  
  min_value <- min(x)
  max_value <- max(x)
  range_value <- max_value - min_value
  
  return(list(
    Minimum = min_value,
    Maximum = max_value,
    Range = range_value
  ))
}

result2 <- range_stats(c(5, 15, 25, 35, 45))
print(result2)