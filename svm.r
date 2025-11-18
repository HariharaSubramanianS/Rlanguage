# Step 1: load libraries
library(e1071) # For SVM
library(caret) # For data preprocessing and accuracy metrics

# Step 2: Read the CSV file
data <- read.csv("dataset/employee_supervised_dataset.csv")

# Step 3: Inspect data
str(data)
summary(data)

# Step 4: Convert categorical variables to factors
data$Department <- as.factor(data$Department)
data$Attrition <- as.factor(data$Attrition)

# Step 5: Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$Attrition, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Step 6: Train the SVM model
svm_model <- svm(Attrition ~ Age + Department + EducationLevel +
                   YearsAtCompany + JobSatisfaction + Salary +
                   WorkLifeBalance,
                 data = trainData,
                 kernel = "radial", # you can also try "linear", "polynomial"
                 cost = 1, gamma = 0.1)

# Step 7: Make predictions
predictions <- predict(svm_model, testData)

# Step 8: Evaluate model performance
conf_matrix <- confusionMatrix(predictions, testData$Attrition)
print(conf_matrix)

# Step 9: Check accuracy
accuracy <- conf_matrix$overall['Accuracy']
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%"))