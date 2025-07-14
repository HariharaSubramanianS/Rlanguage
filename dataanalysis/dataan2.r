# Simulated dataset
data <- data.frame(
  Sales = c(200, 240, 300, 280, 310, 400),
  Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun"),
  Marketing_Spend = c(20, 30, 40, 35, 45, 50)
)

# Descriptive Analytics
summary(data)

# Diagnostic Analytics: Correlation between Sales and Marketing Spend
cor(data$Sales, data$Marketing_Spend)

# Predictive Analytics: Simple Linear Regression
model <- lm(Sales ~ Marketing_Spend, data = data)
summary(model)

# Prescriptive Analytics: Optimize spend for max predicted sales
predict(model, newdata = data.frame(Marketing_Spend = 55))