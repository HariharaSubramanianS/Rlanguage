library(cluster)
library(factoextra)

# Load and Prepare Data
data(iris)
iris_data <- iris[, -5] # Remove the species column (non-numeric)

# compute Manhattan distance matrix
manhattan_dist <- dist(iris_data, method = "manhattan")

# Apply PAM clustering (K = 3 to match iris species)
set.seed(123)
pam_result <- pam(manhattan_dist, k = 3)

# Print clustering results
print(pam_result)
cat("\nComparison of PAM Clusters vs Actual Species:\n")
print(table(pam_result$clustering, iris$Species))