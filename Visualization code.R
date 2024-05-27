# Load required libraries
library(dplyr)
library(ggplot2)

# Assuming 'Merged' is the name of your dataset
Mergered <- read_excel("C:/Users/Comptuer -1/Desktop/Datasets/Mergered.xlsx")

# Check for missing values
missing_values <- sum(is.na(Mergered))
if(missing_values > 0) {
  cat("There are", missing_values, "missing values in the dataset.\n")
  cat("Removing missing values...\n")
  Merged <- na.omit(Mergered)
}

# Descriptive analysis
summary(Mergered)

# Visualization
# Comparison of member_casual variable
ggplot(Merged, aes(x = member_casual)) +
  geom_bar(aes(fill = member_casual)) +
  labs(title = "Comparison of Member and Casual Users",
       x = "User Type",
       y = "Count") +
  theme_minimal()

# Boxplot for ride_length by member_casual
ggplot(Merged, aes(x = member_casual, y = ride_length)) +
  geom_boxplot(aes(fill = member_casual)) +
  labs(title = "Ride Length Distribution by User Type",
       x = "User Type",
       y = "Ride Length") +
  theme_minimal()

# Boxplot for day_of_week by member_casual
ggplot(Merged, aes(x = factor(day_of_week), y = ride_length)) +
  geom_boxplot(aes(fill = member_casual)) +
  labs(title = "Ride Length Distribution by Day of Week and User Type",
       x = "Day of Week",
       y = "Ride Length") +
  theme_minimal()