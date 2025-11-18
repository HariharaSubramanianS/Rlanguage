# Load libraries
library(class)
library(caret)
library(dplyr)

# Read dataset
data <- read.csv("dataset/employee_supervised_dataset.csv")

# Convert categorical columns
data$Department <- as.factor(data$Department)
data$Attrition <- as.factor(data$Attrition)

# Select features and target
features <- data %>% select(-EmployeeID, -Attrition)
target <- data$Attrition

# Normalize numeric features (important for KNN)
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

features_norm <- as.data.frame(lapply(features, function(x) {
  if (is.numeric(x)) normalize(x) else as.numeric(as.factor(x))
}))

# Split data (70% train, 30% test)
set.seed(123)
train_index <- createDataPartition(target, p = 0.7, list = FALSE)
train_data <- features_norm[train_index, ]
test_data <- features_norm[-train_index, ]
train_labels <- target[train_index]
test_labels <- target[-train_index]

# Run KNN (k = 3)
k <- 3
predictions <- knn(train = train_data, test = test_data, cl = train_labels, k = k)

# Print predictions
cat("KNN Predictions:\n")
print(predictions)

# Evaluate performance
conf_matrix <- confusionMatrix(predictions, test_labels)
print(conf_matrix)