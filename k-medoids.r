# Load required libraries
library(cluster)
library(factoextra)
library(ggplot2)

# Load your dataset
data <- read.csv("dataset/employee_supervised_dataset.csv")

# Remove non-numeric columns (e.g., employee names, IDs, categories)
employee_data <- data[, sapply(data, is.numeric)]

# Compute Manhattan distance matrix
manhattan_dist <- dist(employee_data, method = "manhattan")

# Apply k-medoids clustering (PAM) with 3 clusters
set.seed(123)
pam_result <- pam(manhattan_dist, k = 3)

# Display results
print(pam_result)

  #cat("\nComparison of K-Medoids Clusters vs Actual Labels:\n")
 # print(table(pam_result$EducationLevel, data$Attrition))
