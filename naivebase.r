# Step 1: Load the dataset
library(e1071)
library(caret)

data <- read.csv("dataset/employee_supervised_dataset.csv")

# Step 2: Convert categorical variables to factors
data$Department <- as.factor(data$Department)
data$Attrition <- as.factor(data$Attrition)

# Step 3: Split into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$Attrition, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Step 4: Train Naive Bayes classifier
nb_model <- naiveBayes(Attrition ~ Age + Department + EducationLevel + YearsAtCompany +
                       WorkLifeBalance + JobSatisfaction + Salary, 
                       data = trainData)

# Step 5: Predict on test data
predictions <- predict(nb_model, testData)

# Step 6: Evaluate model
conf_matrix <- confusionMatrix(predictions, testData$Attrition)
print(conf_matrix)