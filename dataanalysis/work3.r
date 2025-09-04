options(repos= c(CRAN = "https://cloud.r-project.org"))

if(!require(randomForest)) {
    install.packages('randomForest', dependencies = TRUE)
    library(randomForest)
}

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

#Random Forest Attribution
rf_model <- randomForest(Genre ~ Age + Annual_Income + Spending_Score , data=mall_data, ntree=100)
cat("\n--- Randomforest Model summary (Genre) ---\n")
print(rf_model)