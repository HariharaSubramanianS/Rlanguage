options(repos= c(CRAN = "https://cloud.r-project.org"))
mall_data <- read.csv('dataset\\Mall_customers.csv', stringsAsFactors = TRUE)

num_data <- mall_data[ c('Spending_Score', 'Age', 'Annual_Income')]


scaled_data <- scale(num_data)


#K Means clustering (3 clusters)
set.seed(123)
kmeans_result <- kmeans(scaled_data, center=3, nstart=25)
cat("\n--- K-means Clustering (3 clusters) ---\n")
print(kmeans_result$centers)
cat("\nCluster assignments: \n")
print(table(kmeans_result$cluster))