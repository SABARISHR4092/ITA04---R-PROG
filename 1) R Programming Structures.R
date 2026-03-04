# 1. Program to print length, type (typeof), and class of a numeric vector

num_vector <- c(10, 20, 30, 40, 50)

cat("Length of vector:", length(num_vector), "\n")
cat("Type of vector (typeof):", typeof(num_vector), "\n")
cat("Class of vector:", class(num_vector), "\n")



# 2. Create a list containing a vector, matrix, and data frame
#    and display its structure using str()

my_vector <- c(1, 2, 3, 4)

my_matrix <- matrix(c(5, 6, 7, 8), nrow = 2)

my_dataframe <- data.frame(
  Name = c("John", "Alice"),
  Age = c(22, 24)
)

my_list <- list(
  Vector = my_vector,
  Matrix = my_matrix,
  DataFrame = my_dataframe
)

cat("\nStructure of the list:\n")
str(my_list)