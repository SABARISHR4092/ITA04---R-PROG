#Create a list of 5 items and use a loop to print each element
# Create a list with 5 items
my_list <- list(
  100,
  "R Programming",
  TRUE,
  c(1, 2, 3),
  list(a = 10, b = 20)
)

# Loop through the list and print each element
for (item in my_list) {
  print(item)
}

#Create a list containing vectors of different lengths and use a loop to print thelength of each item.
# Create list containing vectors of different lengths
vector_list <- list(
  c(10, 20, 30),
  c(5, 15),
  c(1, 2, 3, 4, 5),
  c(100),
  c(7, 14, 21, 28)
)

# Loop through the list
for (i in seq_along(vector_list)) {
  cat("Length of item", i, ":", length(vector_list[[i]]), "\n")
}
  