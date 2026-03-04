# E-COMMERCE SALES ANALYSIS

# Create sales matrix (7 days × 4 products)
sales_matrix <- matrix(
  c(10,15,12,18,20,14,16,   # Product A
    8,9,11,10,12,7,13,      # Product B
    5,6,7,8,9,4,6,          # Product C
    20,18,22,25,24,19,21),  # Product D
  nrow = 7,
  ncol = 4
)

# Assign column names (products)
colnames(sales_matrix) <- c("ProductA","ProductB","ProductC","ProductD")

# Assign row names (days)
rownames(sales_matrix) <- paste("Day",1:7,sep="")

# Display sales matrix
sales_matrix


# Calculate total sales per day (row-wise)
daily_total <- rowSums(sales_matrix)
daily_total

# Calculate product-wise total sales (column-wise)
product_total <- colSums(sales_matrix)
product_total


# Create price vector for products
price_vector <- c(100, 150, 200, 80)

# Multiply sales by price to calculate revenue matrix
revenue_matrix <- sweep(sales_matrix, 2, price_vector, "*")
revenue_matrix

# Calculate total revenue per product
product_revenue <- colSums(revenue_matrix)
product_revenue

# Calculate total weekly revenue
total_revenue <- sum(revenue_matrix)
total_revenue


# Store product names as character vector
product_names <- c("ProductA","ProductB","ProductC","ProductD")
product_names

# Character vector stores text data and elements must be same type


# Calculate weekly average sales (based on daily totals)
weekly_average <- mean(daily_total)
weekly_average

# Identify days where sales exceeded weekly average
high_sales_days <- daily_total > weekly_average
high_sales_days

# Display high sales days
sales_matrix[high_sales_days, ]


# Example array (3D: day × product × week)
sales_array <- array(sales_matrix, dim = c(7,4,1))
sales_array


# Define S3 class "Product"
Product <- function(name, category, price) {
  structure(
    list(Name = name, Category = category, Price = price),
    class = "Product"
  )
}

# Create example product object
p1 <- Product("ProductA", "Electronics", 100)
p1

# Check class of object
class(p1)