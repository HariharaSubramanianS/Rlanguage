options(repos= c(CRAN = "https://cloud.r-project.org"))
car_data <- read.csv('dataset\\cars_ds_final.csv', stringsAsFactors = TRUE)

num_data <- car_data[ c('Cylinders', 'Valves_Per_Cylinder')]

scaled_data <- scale(num_data)
data <- na.omit(data)


#K Means clustering (3 clusters)
set.seed(123)
kmeans_result <- kmeans(scaled_data, center=3, nstart=25)
cat("\n--- K-means Clustering (3 clusters) ---\n")
print(kmeans_result$centers)
cat("\nCluster assignments: \n")
print(table(kmeans_result$cluster))
