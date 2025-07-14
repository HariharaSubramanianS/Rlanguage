library(dplyr)
library(ggplot2)
library(corrplot)

if(!dir.exists("dataanalysis")) {
    dir.create("dataanalysis")
}

data <- read.csv("dataset/supermarket_sales.csv", header=TRUE, na.strings=c("?", "", "NA"))

data <- data %>% mutate(across(where(is.character), as.factor))

sink("dataanalysis/console_output.txt")

cat("\n=== Data Structure ===\n")
str(data)

cat("\n=== Data Summary ===\n")
print(summary(data))

#  Histogram: Rating Distribution
p1 <- ggplot(data, aes(x = Rating)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", colour = "black") +
  ggtitle("Rating Distribution")
ggsave("dataanalysis/rating_histogram.png", plot = p1, width = 7, height = 5)

#  Barplot: Payment Method Distribution
p2 <- ggplot(data, aes(x = Payment)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Payment Method Distribution")
ggsave("dataanalysis/payment_barplot.png", plot = p2, width = 7, height = 5)

#  Boxplot: Product Line vs Total
p3 <- ggplot(data, aes(x = 'Product line', y = Total)) +
  geom_boxplot(fill = "tomato") +
  ggtitle("Total Bill vs Product Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("dataanalysis/total_boxplot.png", plot = p3, width = 7, height = 5)

#  Boxplot: Gender vs Gross Income
p4 <- ggplot(data, aes(x = Gender, y = 'gross income')) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Gross Income vs Gender")
ggsave("dataanalysis/income_gender_boxplot.png", plot = p4, width = 7, height = 5)