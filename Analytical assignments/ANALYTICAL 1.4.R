# WEATHER MONITORING SYSTEM

# Create month vector
month <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

# Create temperature vector
temperature <- c(25,27,30,32,35,33,31,30,29,28,26,24)

# Create humidity vector
humidity <- c(60,58,55,50,48,65,70,72,68,63,59,61)

# Create rainfall vector
rainfall <- c(10,15,20,25,40,120,150,130,90,60,30,15)

# Create wind speed vector
wind_speed <- c(8,10,12,15,18,20,22,21,17,14,11,9)

# Combine into data frame
weather_data <- data.frame(month, temperature, humidity, rainfall, wind_speed)

weather_data


# Convert month into factor
weather_data$month <- factor(weather_data$month, levels = month)

weather_data

# Factor is suitable for categorical data with fixed levels


# Create 3D array (month × parameter × year)
weather_array <- array(
  c(temperature, humidity, rainfall, wind_speed),
  dim = c(12,4,1),
  dimnames = list(
    month,
    c("Temperature","Humidity","Rainfall","WindSpeed"),
    "Year1"
  )
)

weather_array


# Calculate mean temperature
mean_temperature <- mean(weather_data$temperature)
mean_temperature

# Calculate maximum rainfall
max_rainfall <- max(weather_data$rainfall)
max_rainfall


# Function to calculate seasonal average temperature
seasonal_avg <- function(temp_vector) {
  winter <- mean(temp_vector[c(12,1,2)])
  summer <- mean(temp_vector[c(3,4,5)])
  monsoon <- mean(temp_vector[c(6,7,8,9)])
  post_monsoon <- mean(temp_vector[c(10,11)])
  return(list(Winter=winter, Summer=summer, Monsoon=monsoon, PostMonsoon=post_monsoon))
}

# Call function
seasonal_avg(temperature)


# Arrays can store data in more than two dimensions while matrices are strictly two-dimensional