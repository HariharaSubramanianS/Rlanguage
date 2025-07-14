# Load libraries
library(keras)
library(tensorflow)
library(dplyr)
library(readr)

# Load data
data <- read_csv("dataset/adult.csv")

# Convert income to binary
data$income <- ifelse(data$income == ">50K", 1L, 0L)

# Convert categorical variables to factors
data <- data %>% mutate(across(where(is.character), as.factor))

# One-hot encoding for categorical variables
data <- model.matrix(income ~ . -1, data = data) 
data <- as.data.frame(data)

# Append target variable again
data$income <- as.integer(data$income)

# Split into train/test
set.seed(123)
split <- createDataPartition(data$income, p = 0.8, list = FALSE)
train_data <- data[split, ]
test_data <- data[-split, ]

train_x <- as.matrix(train_data[, -ncol(train_data)])
train_y <- train_data$income
test_x <- as.matrix(test_data[, -ncol(test_data)])
test_y <- test_data$income

# Build model
model <- keras_model_sequential() %>%
  layer_dense(units = 64, activation = "relu", input_shape = ncol(train_x)) %>%
  layer_dense(units = 32, activation = "relu") %>%
  layer_dense(units = 1, activation = "sigmoid")

# Compile model
model %>% compile(
  loss = "binary_crossentropy",
  optimizer = "adam",
  metrics = c("accuracy")
)

# Train model
history <- model %>% fit(
  train_x, train_y,
  epochs = 20,
  batch_size = 32,
  validation_split = 0.2
)

# Evaluate
model %>% evaluate(test_x, test_y)

# Predict
pred_prob <- model %>% predict(test_x)
pred_class <- ifelse(pred_prob > 0.5, 1, 0)

# Accuracy
mean(pred_class == test_y)