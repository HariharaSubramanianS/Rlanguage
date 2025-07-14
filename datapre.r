# Load required libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# Step 1: Read the CSV file
data <- read.csv("dataset/adult.csv", header = TRUE, na.strings = c("?", "", "NA"))

# Step 2: Data Quality Assessment
cat("\n=== Data Summary ===\n")
print(summary(data))

cat("\n=== Missing Values by Column ===\n")
print(colSums(is.na(data)))

cat("\n=== Structure of Data ===\n")
print(str(data))

# Step 3: Data Cleaning
# Convert appropriate columns to factors
categorical_cols <- c("workclass", "education", "marital.status", "occupation", 
                      "relationship", "race", "gender", "nativeCountry", "income")
data[categorical_cols] <- lapply(data[categorical_cols], as.factor)

# Remove rows with missing values
data <- na.omit(data)
# Step 4: Data Transformation
# Normalize numeric features
numeric_cols <- c("age", "fnlwgt", "education_num", "capitalGain", "capitalLoss", "hoursPerWeek")
data[numeric_cols] <- scale(data[numeric_cols])

# Step 5: Data Reduction
# Example: Remove 'fnlwgt' as it’s often not useful
data <- data %>% select(-fnlwgt)

# Step 6: Final Structure and Preview
cat("\n=== Cleaned and Transformed Data Preview ===\n")
print(head(data))

cat("\n=== Final Structure ===\n")
print(str(data))

# Optional: Save cleaned data
write.csv(data, "adult_cleaned.csv", row.names=FALSE)