# Step 1: Load the dataset
library(caret)
library(randomForest)
library(e1071)

data <- read.csv("dataset/data.csv")

print(head(data))

# Step 2: Convert categorical variables to factors
data$private <- as.factor(data$private)

# Step 3: Split into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$enroll, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# 6. Train Random Forest model
rf_model <- randomForest(
  enroll ~ . - grad_rate,
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
conf_matrix <- confusionMatrix(predictions, testData$enroll)
print(conf_matrix)

# 10. Feature Importance plot
varImpPlot(rf_model)

#Naive Baise
nb_model <- naiveBayes(enroll ~ accept + top10perc  + top25perc + f_undergrad + p_undergrad
                        + phd + expend , 
                       data = trainData)


predictions <- predict(nb_model, testData)


conf_matrix <- confusionMatrix(predictions, testData$enroll)
print(conf_matrix)