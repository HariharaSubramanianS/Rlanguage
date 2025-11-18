# Step 1: Load the dataset
library(e1071)
library(caret)

data <- read.csv("dataset/StudentsPerformance.csv")

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

# Step 4: Train Naive Bayes classifier
nb_model <- naiveBayes(race_ethnicity ~ math_score + reading_score + writing_score + gender +
                       parentallevelofeducation + lunch + race, 
                       data = trainData)

# Step 5: Predict on test data
predictions <- predict(nb_model, testData)

# Step 6: Evaluate model
conf_matrix <- confusionMatrix(predictions, testData$race_ethnicity)
print(conf_matrix)