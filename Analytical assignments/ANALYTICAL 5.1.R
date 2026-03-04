# =====================================================
# SALES TREND AND REVENUE FORECASTING (BASE R VERSION)
# =====================================================

set.seed(123)

# Monthly Data for 5 Years (60 Months)
months <- 1:60
sales <- 50000 + 2000 * months + rnorm(60, 0, 10000)

data <- data.frame(Month = months, Sales = sales)

# Category-wise Sales
categories <- c("Electronics", "Clothing", "Groceries", "Furniture")
category_sales <- c(1200000, 800000, 600000, 400000)

# -----------------------------------------------------
# 1. Line Chart
# -----------------------------------------------------

plot(data$Month, data$Sales, type="l",
     main="Monthly Sales Trend",
     xlab="Month",
     ylab="Sales Revenue",
     col="blue",
     lwd=2)

# -----------------------------------------------------
# Bar Plot (Category-wise)
# -----------------------------------------------------

barplot(category_sales,
        names.arg=categories,
        main="Category-wise Sales",
        col="lightgreen")

# -----------------------------------------------------
# 2. Pie Chart
# -----------------------------------------------------

pie(category_sales,
    labels=categories,
    main="Sales Distribution by Category",
    col=rainbow(4))

# -----------------------------------------------------
# 3. Low-Level Custom Plot
# -----------------------------------------------------

plot(data$Month, data$Sales, type="n",
     main="Customized Sales Plot",
     xlab="Month",
     ylab="Sales")

lines(data$Month, data$Sales, col="red", lwd=2)
axis(1, at=seq(0,60,by=6))
axis(2)
box()

# -----------------------------------------------------
# 4. Linear Regression
# -----------------------------------------------------

model <- lm(Sales ~ Month, data=data)
summary_model <- summary(model)

print(summary_model)

# Add Regression Line
abline(model, col="darkgreen", lwd=2)

# -----------------------------------------------------
# 5. Interpretation
# -----------------------------------------------------

cat("\nIntercept:", coef(model)[1], "\n")
cat("Slope:", coef(model)[2], "\n")
cat("R-squared:", summary_model$r.squared, "\n")

# -----------------------------------------------------
# 6. Save Graphs
# -----------------------------------------------------

png("Line_Chart.png")
plot(data$Month, data$Sales, type="l", col="blue")
dev.off()

png("Bar_Plot.png")
barplot(category_sales, names.arg=categories)
dev.off()

png("Pie_Chart.png")
pie(category_sales, labels=categories)
dev.off()

cat("\nGraphs Saved Successfully!\n")