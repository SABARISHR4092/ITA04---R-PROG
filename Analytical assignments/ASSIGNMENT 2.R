# Assignment 1: Variable Declaration and Type Checking

# Numeric variable
num_var <- 25

# Character variable
char_var <- "Hello R"

# Logical variable
logical_var <- TRUE

# Integer variable
int_var <- 10L

# Double variable
double_var <- 3.14

# Vector variable
vector_var <- c(1, 2, 3, 4)

# List variable
list_var <- list(name="John", age=25)

# Factor variable
factor_var <- factor(c("A","B","A","C"))



# Checking typeof()
typeof(num_var)
typeof(char_var)
typeof(logical_var)
typeof(int_var)
typeof(double_var)
typeof(vector_var)
typeof(list_var)
typeof(factor_var)

# Checking class()
class(num_var)
class(char_var)
class(logical_var)
class(int_var)
class(double_var)
class(vector_var)
class(list_var)
class(factor_var)

# Assignment 2: Factorial using while loop

num <- 5
factorial <- 1
i <- 1

# While loop to calculate factorial
while(i <= num){
  factorial <- factorial * i
  i <- i + 1
}

# Display result
cat("Factorial of", num, "is", factorial)