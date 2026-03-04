# BANKING INTEREST CALCULATION SYSTEM

# Initial values
principal <- 10000
rate <- 0.08
target_amount <- 20000
time <- 0
balance <- principal

# While loop to calculate compound interest until target is reached
while(balance < target_amount){
  
  time <- time + 1
  
  # Compound interest formula: A = P(1 + r)
  balance <- balance * (1 + rate)
  
  # Skip calculation if balance becomes NA
  if(is.na(balance)){
    next
  }
  
  # Stop loop if balance exceeds double the target (safety condition)
  if(balance > target_amount * 2){
    break
  }
}

balance
time


# Function with default interest rate and time period
calculate_compound <- function(principal, rate = 0.05, years = 5){
  
  amount <- principal * (1 + rate)^years
  
  # Implicit return (last evaluated expression is returned)
  amount
}

calculate_compound(10000)


# Function returning multiple outputs (complex object)
calculate_details <- function(principal, rate = 0.05, years = 5){
  
  final_amount <- principal * (1 + rate)^years
  
  total_interest <- final_amount - principal
  
  return(list(
    Final_Amount = final_amount,
    Total_Interest = total_interest,
    Years = years
  ))
}

calculate_details(10000, 0.08, 3)