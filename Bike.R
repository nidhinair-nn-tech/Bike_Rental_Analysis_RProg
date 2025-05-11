# INFO6105 Final Project: Bike Sharing Dataset Analysis
# Author: Nidhi Nair
# Dataset: https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset
# File used: day.csv
# ============================================
# -------------------------------
# INSTALL REQUIRED PACKAGES FIRST
# Run these lines once to install the packages
# -------------------------------
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("corrplot")

# -------------------------------
# LOAD LIBRARIES
# -------------------------------
library(ggplot2)   # For visualizations
library(dplyr)     # For data manipulation
library(corrplot)  # For correlation matrix

# -------------------------------
# LOAD THE DATA
# Make sure 'day.csv' is in your working directory
# You can set your working directory with: setwd("your/path/here")
# -------------------------------
getwd()
setwd("/Users/nidhinair/Work/DSEM/RPrograms/bike_dataset")
# Data Ingestion
bike_data <- read.csv("day.csv")

# -------------------------------
# EXPLORING THE DATA STRUCTURE
# This helps understand what variables are available
# -------------------------------
str(bike_data)
# Data Cleaning
# Convert the date column-dteday to a Date object.
# Adjust the format string to "YYYY-MM-DD".
bike_data$dteday <- as.Date(bike_data$dteday, format = "%Y-%m-%d")

# Convert known categorical columns to factors.
cols_to_factor_day <- c("season", "yr", "mnth", "holiday", "weekday", "workingday", "weathersit")
bike_data[cols_to_factor_day] <- lapply(bike_data[cols_to_factor_day], as.factor)

# Remove rows with any missing values.
bike_data <- na.omit(bike_data)

# -------------------------------
# QUESTION 1: What factors influence bike rental demand?
# We'll check correlation between rental count and weather-related variables
# and build a regression model
# -------------------------------

# Select relevant numeric columns for correlation
numeric_vars <- bike_data %>%
  select(cnt, temp, atemp, hum, windspeed)

# Compute and plot correlation matrix
cor_matrix <- cor(numeric_vars)
corrplot(cor_matrix, method = "circle")  # Visualize correlations

# Build a linear regression model to understand influence
model <- lm(cnt ~ temp + hum + windspeed + season + weathersit, data = bike_data)

# View model summary with coefficients and significance levels
summary(model)

# Visualize relationship between temperature and rentals
ggplot(bike_data, aes(x = temp, y = cnt)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Bike Rentals vs Temperature", 
       x = "Normalized Temperature", 
       y = "Bike Rentals")

# -------------------------------
# QUESTION 2: Do average daily rentals differ between weekdays and weekends?
# We'll create a new column and use statistical testing
# -------------------------------

# Add a new column to label day as "Weekday" or "Weekend"
# 0 = Sunday, 6 = Saturday
bike_data$day_type <- ifelse(bike_data$weekday %in% c(0,6), "Weekend", "Weekday")

# Calculate average rentals by day type
avg_rentals <- bike_data %>%
  group_by(day_type) %>%
  summarise(mean_rentals = mean(cnt))

# Print average rentals
print(avg_rentals)

# Visualize distribution using boxplot
ggplot(bike_data, aes(x = day_type, y = cnt, fill = day_type)) +
  geom_boxplot() +
  labs(title = "Bike Rentals: Weekday vs Weekend", 
       x = "Day Type", 
       y = "Rental Count")

# Run t-test to compare means between weekdays and weekends
t_test_result <- t.test(cnt ~ day_type, data = bike_data)

# Print t-test results
print(t_test_result)