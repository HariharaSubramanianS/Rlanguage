options(repos= c(CRAN = "https://cloud.r-project.org"))

if(!require(randomForest)) {
    install.packages('randomForest', dependencies = TRUE)
    library(randomForest)
}

#Supervised learning
supervised_data <- read.csv('dataset\\employee_supervised_dataset.csv', stringsAsFactors = TRUE)

supervised_data$Attrition <- as.factor(supervised_data$Attrition)


cat("\n--- Supervised Data Summary ---\n")
print(summary(supervised_data))

lm_model <- lm(Salary ~ Age + YearsAtCompany + JobSatisfaction, data = supervised_data)
cat("\n--- Linear Regression Summary (Salary ~ Age + YearsAtCompany + JobSatisfaction) ---\n")
print(summary(lm_model))

#Random Forest Attribution
rf_model <- randomForest(Attrition ~ Age + Department + EducationLevel + YearsAtCompany +
                                                      JobSatisfaction + Salary + WorkLifeBalance, data=supervised_data, ntree=100)
cat("\n--- Randomforest Model summary (Attrition) ---\n")
print(rf_model)

#Unsupervised Learning

unsupervised_data <- read.csv('dataset\\employee_unsupervised_dataset.csv', stringAsFactors=TRUE)

cat("\n--- Unsupervised Data Summary ---\n")
print(summary(unsupervised_data))

num_data <- unsupervised_data[, c('Age', 'EducationLevel', 'YearsAtCompany', 'JobSatisfaction', 'Salary', 'WorkLifeBalance')]

scaled_data <- scale(num_data)

#K Means clustering (3 clusters)
set.seed(123)
kmeans_result <- kmeans(scaled_data, center=3, nstart=25)
cat("\n--- K-means Clustering (3 clusters) ---\n")
print(kmeans_result$centers)
cat("\nCluster assignments: \n")
print(table(kmeans_result$cluster))

# Hierarchical clustering
hc <- hclust(dist(scaled_data), method='ward.D2')
cat("\n--- Hierarchical Clustering Dendrogram ---\n")
#plot dendrogram
png('hierarchical_dendrogram.png')
plot(hc, main="Hierarchical Clustering Dendrogram", xlabs="", sub="")
dev.off()

cat("\nDendrogram saved as hierarchical_dendrogram.png\n")