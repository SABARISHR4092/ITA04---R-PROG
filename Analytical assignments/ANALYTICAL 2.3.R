# INVENTORY MANAGEMENT SYSTEM

# Create a list of products (non-vector structure)
inventory <- list(
  list(name="Shirt", stock=20),
  list(name="Jeans", stock=5),
  list(name="Shoes", stock=12),
  list(name="Jacket", stock=3),
  list(name="Cap", stock=15)
)

# Define threshold for low stock
threshold <- 10

# For loop to iterate over list (non-vector set)
for(i in 1:length(inventory)){
  
  product_name <- inventory[[i]]$name
  product_stock <- inventory[[i]]$stock
  
  # Identify low stock using if-else
  if(product_stock < threshold){
    cat(product_name, "is LOW in stock\n")
  } else {
    cat(product_name, "has sufficient stock\n")
  }
}

cat("\n")

# Apply boolean operators for multiple conditions
for(i in 1:length(inventory)){
  
  stock <- inventory[[i]]$stock
  
  # Check if stock is low AND positive
  if(stock < threshold & stock > 0){
    cat(inventory[[i]]$name, "needs restocking\n")
  }
  
  # Check if stock is zero OR negative
  if(stock <= 0 | is.na(stock)){
    cat(inventory[[i]]$name, "is OUT OF STOCK\n")
  }
}

cat("\n")

# Function to update stock and return complex object
update_stock <- function(product_list, restock_amount = 10){
  
  updated_inventory <- product_list
  low_stock_items <- c()
  
  for(i in 1:length(updated_inventory)){
    
    if(updated_inventory[[i]]$stock < threshold){
      
      low_stock_items <- c(low_stock_items, updated_inventory[[i]]$name)
      
      updated_inventory[[i]]$stock <- 
        updated_inventory[[i]]$stock + restock_amount
    }
  }
  
  # Returning complex object (list)
  return(list(
    Updated_Inventory = updated_inventory,
    Restocked_Products = low_stock_items
  ))
}

# Call function
result <- update_stock(inventory)

# Display results
result$Updated_Inventory
result$Restocked_Products


# Demonstrating that functions are objects
f <- update_stock
f(inventory)