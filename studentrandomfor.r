# Step 1: Load the dataset
library(caret)
library(randomForest)

data <- read.csv("dataset/StudentsPerformance.csv")

print(head(data))

# Step 2: Convert categorical variables to factors
data$gender <- as.factor(data$gender)
data$race <- as.factor(data$race)
data$parentallevelofeducation <- as.factor(data$parentallevelofeducation)
data$lunch <- as.factor(data$lunch)
data$testpreparationcourse <- as.factor(data$testpreparationcourse)
data$race_ethnicity <- as.factor(data$race_ethnicity)


# Step 3: Split into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$race_ethnicity, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# 6. Train Random Forest model
rf_model <- randomForest(
  race_ethnicity ~ . - testpreparationcourse,
  data = trainData,
  ntree = 100,
  mtry = 3,
  importance = TRUE
)

# 7. Print model summary
print(rf_model)

# 8. Predict on test data
predictions <- predict(rf_model, testData)

# 9. Confusion matrix
conf_matrix <- confusionMatrix(predictions, testData$race_ethnicity)
print(conf_matrix)

# 10. Feature Importance plot
varImpPlot(rf_model)
