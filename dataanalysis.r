library(dplyr)
library(ggplot2)
library(corrplot)

if(!dir.exists("dataanalysis")) {
    dir.create("dataanalysis")
}

data <- read.csv("dataset/adult.csv", header=TRUE, na.strings=c("?", "", "NA"))

data <- data %>% mutate(across(where(is.character), as.factor))

sink("dataanalysis/console_output.txt")

cat("\n=== Data Structure ===\n")
str(data)

cat("\n=== Data Summary ===\n")
print(summary(data))

cat("\n=== MIssing Value ===\n")
print(colSums(is.na(data)))

cat("\n=== Income Distribution ===\n")
print(table(data$income))

cat("\n=== Correlation Matrix ===\n")
numeric_data <- data %>% select(where(is.numeric))
corr_matrix <- cor(numeric_data)
print(corr_matrix)

cat("\n=== Income by Education ===\n")
print(table(data$education, data$income))

sink()

#Histogram of age
p1 <- ggplot(data, aes(x=age)) +
geom_histogram(binwidth = 5, fill = "skyblue", colour = "black") +
ggtitle("Age Distribution")
ggsave("dataanalysis/age_histogram.png", plot = p1, width = 7, height = 5)

#Income distribution
p2 <- ggplot(data, aes(x=income)) +
geom_bar(fill = "steelblue") +
ggtitle("Income Distribution")
ggsave("dataanalysis/income_barplot.png", plot = p2, width = 7, height = 5)

# Boxplot: Age vs Income
p3 <- ggplot(data, aes(x=income, y=age)) +
geom_boxplot(fill = "tomato") +
ggtitle("Age vs Income")
ggsave("dataanalysis/age_income_boxplot.png", plot = p3, width = 7, height = 5)

# Boxplot: Hours vs Income
p4 <- ggplot(data, aes(x=income, y=hoursPerWeek)) +
geom_boxplot(fill = "lightgreen") +
ggtitle("Hours Per Week vs Income")
ggsave("dataanalysis/hours_income_boxplot.png", plot = p4, width = 7, height = 5)

# Education vs Income
p5 <- ggplot(data, aes(x=education, fill=income)) +
geom_bar(position = "fill") +
coord_flip() +
ggtitle("Proportion of Income by Education")
ggsave("dataanalysis/education_income_barplot.png", plot = p5, width = 7, height = 5)

# Gender vs Income
p6 <- ggplot(data, aes(x=gender, fill = income)) +
geom_bar(position = "dodge") +
ggtitle("Gender vs Income")
ggsave("dataanalysis/gender_income_barplot.png", plot = p6, width = 6, height = 5)

# Race vs income
p7 <- ggplot(data, aes(x=race, fill=income)) +
geom_bar(position = "fill") +
ggtitle("Proportion of Income by Race")
ggsave("dataanalysis/race_income_barplot.png", plot = p7, width = 6, height = 5)

#correlation plot
png("dataanalysis/correlation_plot.png", width= 700, height= 600)
corrplot(corr_matrix, method = "color", type = "upper", tl.cex = 0.8)
dev.off()

# Also save summary as text
summary_df <- summary(data)  
capture.output(summary_df, file = "dataanalysis/data_summary.txt")