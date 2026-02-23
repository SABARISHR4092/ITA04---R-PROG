stats_func <- function(x) {
  mean_val <- mean(x)
  sd_val <- sd(x)
  list(mean=mean_val, sd=sd_val)
}
data <- c(10,20,30,40,50)
output <- stats_func(data)
print(output)
