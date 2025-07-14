# prescriptive Analysis

data <- data.frame(
    Sales = c(200, 300, 450, 560, 670, 710),
    Month = c("Jan", "Feb", "Mar", "Aprl", "May", "June"),
    Marketing_Spend = c(20, 30, 55, 40, 60, 75)

)

# #Descriptive Analysis
# summary(data)

# #Diagnostic Analysis: Coorelation between sales and marketing


# # predictive Analysis
# model <- lm(Sales ~ Marketing_Spend, data = data)
# summary(model)

# # prescriptive Analysis
# predict(model, newdata= data.frame(Marketing_spend = 55))


# Descriptive Analytics
summary(data)

# Diagnostic Analytics: Correlation between Sales and Marketing Spend
cor(data$Sales, data$Marketing_Spend)

# Predictive Analytics: Simple Linear Regressions
model <- lm(Sales ~ Marketing_Spend, data = data)
summary(model)

# Prescriptive Analytics: Optimize spend for max predicted sales
predict(model, newdata = data.frame(Marketing_Spend = 55))




# Load necessary libraries
library(forecast)

# Create a time series object
sales_ts <- ts(data$Sales, start = c(2023, 1), frequency = 12)

# Apply ARIMA model
fit <- auto.arima(sales_ts)
forecast_sales <- forecast(fit, h = 6)
 
# Save the plot to PNG file
png("forecast_sales_plot.png", width = 800, height = 600)
plot(forecast_sales, main = "6-Month Sales Forecast")
dev.off()

