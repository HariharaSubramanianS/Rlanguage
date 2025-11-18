# 1. Load Libraries
library(caret)
library(randomForest)

# 2. Set Working Directory (Adjust path if needed)
# setwd("C:/path/to/your/project")

# 3. Load Dataset
data <- read.csv("dataset/employee_supervised_dataset.csv")

# Print first few rows to inspect the data
print(head(data))


# 4. Convert necessary columns to factors
data$Department <- as.factor(data$Department)
data$EducationLevel <- as.factor(data$EducationLevel)
data$JobSatisfaction <- as.factor(data$JobSatisfaction)
data$WorkLifeBalance <- as.factor(data$WorkLifeBalance)
data$Attrition <- as.factor(data$Attrition) 

# 5. Split data into training and test sets
set.seed(123) 
train_index <- createDataPartition(data$Attrition, p = 0.75, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# 6. Train Random Forest model
rf_model <- randomForest(
  Attrition ~ . - EmployeeID,
  data = train_data,
  ntree = 100,
  mtry = 3,
  importance = TRUE
)

# 7. Print model summary
print(rf_model)

# 8. Predict on test data
predictions <- predict(rf_model, test_data)

# 9. Confusion matrix
conf_matrix <- confusionMatrix(predictions, test_data$Attrition)
print(conf_matrix)

# 10. Feature Importance plot
varImpPlot(rf_model)