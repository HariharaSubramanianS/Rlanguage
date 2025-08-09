options(repos= c(CRAN = "https://cloud.r-project.org"))

if(!require(randomForest)) {
    install.packages('randomForest', dependencies = TRUE)
    library(randomForest)
}

# learning
adult_data <- read.csv('dataset\\adultyy.csv', stringsAsFactors = TRUE)
data <- na.omit(data)
adult_data$income <- as.factor(adult_data$income)


cat("\n--- Adult Data Summary ---\n")
print(summary(adult_data))


#Random Forest Attribution
rf_model <- randomForest(income ~ age + workclass + education + gender+
                                                      marital.status + occupation + hours.per.week , data=adult_data, ntree=100)
cat("\n--- Randomforest Model summary (Income) ---\n")
print(rf_model)

#K Means clustering (3 clusters)
set.seed(123)
kmeans_result <- kmeans(adult_data, center=3, nstart=25)
cat("\n--- K-means Clustering (3 clusters) ---\n")
print(kmeans_result$centers)
cat("\nCluster assignments: \n")
print(table(kmeans_result$cluster))
