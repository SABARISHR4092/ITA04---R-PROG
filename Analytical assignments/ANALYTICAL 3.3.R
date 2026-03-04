# ===============================================
# E-COMMERCE SALES DATA PROCESSING SYSTEM
# ===============================================

# ------------------------------------------------
# 1. Create Sample Sales Data (Simulating CSV files)
# ------------------------------------------------

sales_day1 <- data.frame(
  Product_ID = c(101, 102, 103),
  Date = as.Date(c("2024-03-01","2024-03-01","2024-03-01")),
  Region = c("North","South","East"),
  Sales_Amount = c(5000, 3000, 4000)
)

sales_day2 <- data.frame(
  Product_ID = c(101, 102, 103),
  Date = as.Date(c("2024-03-02","2024-03-02","2024-03-02")),
  Region = c("West","North","South"),
  Sales_Amount = c(4500, 3500, 3800)
)

# Combine multiple files (like reading multiple CSVs)
sales_data <- rbind(sales_day1, sales_day2)

cat("Combined Sales Data:\n")
print(sales_data)


# ------------------------------------------------
# 2. Create Product Information Data
# ------------------------------------------------

product_info <- data.frame(
  Product_ID = c(101, 102, 103),
  Product_Name = c("Laptop", "Mobile", "Headphones"),
  Category = c("Electronics", "Electronics", "Accessories")
)

# Merge safely using common column
merged_data <- merge(sales_data, product_info, by = "Product_ID")

cat("\nMerged Sales + Product Data:\n")
print(merged_data)


# ------------------------------------------------
# 3. Melting (Wide → Long Format Example)
# ------------------------------------------------

wide_sales <- data.frame(
  Product_ID = c(101, 102),
  North = c(5000, 3000),
  South = c(4000, 3500),
  East = c(4500, 3200),
  West = c(4800, 3100)
)

cat("\nWide Sales Data:\n")
print(wide_sales)

# Convert Wide to Long using stack()
long_sales <- stack(wide_sales[, 2:5])
long_sales$Product_ID <- rep(wide_sales$Product_ID, 4)

colnames(long_sales) <- c("Sales_Amount", "Region", "Product_ID")

cat("\nLong Format Sales Data:\n")
print(long_sales)


# ------------------------------------------------
# 4. Casting (Region-wise Summary Table)
# ------------------------------------------------

region_summary <- aggregate(Sales_Amount ~ Region,
                            data = long_sales,
                            sum)

cat("\nRegion-wise Total Sales:\n")
print(region_summary)


# ------------------------------------------------
# 5. Modify Sales Values
# ------------------------------------------------

# Increase North region sales by 10%
long_sales$Sales_Amount[long_sales$Region == "North"] <-
  long_sales$Sales_Amount[long_sales$Region == "North"] * 1.10

cat("\nUpdated Sales Data:\n")
print(long_sales)


# ------------------------------------------------
# 6. Write Final Processed Data to CSV
# ------------------------------------------------

write.csv(long_sales,
          "Processed_Ecommerce_Sales.csv",
          row.names = FALSE)

cat("\nFinal Processed Dataset Saved Successfully!\n")