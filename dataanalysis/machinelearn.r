library(e1071)
library(class)
library(caret)
library(dplyr)

data <- read.csv("dataset\\employee_supervised_dataset.csv")

data$EmployeeID <- NULL
print(data)

data$Department <- as.factor(data$Department)
data$Attrition <- as.factor(data$Attrition)
print(data$Department)
print(data$Attrition)

numeric_cols <- sapply(data, is.numeric)
data[numeric_cols] <- scale(data[numeric_cols])
print(data)

set.seed(123)
trainIndex <- createDataPartition(data$Attrition, p=0.7, list=FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]
print("Successfully done")