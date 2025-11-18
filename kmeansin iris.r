# ============================================
# K-Means Clustering on Iris Dataset in R
# ============================================

# 1️⃣ Load the iris dataset
data(iris)
print("First few rows of the Iris dataset:")
head(iris)

# 2️⃣ Prepare the data (remove Species column)
iris_data <- iris[, -5]

# 3️⃣ Apply K-Means clustering
set.seed(123)  # for reproducibility
km_result <- kmeans(iris_data, centers = 3, nstart = 25)

# 4️⃣ Display clustering results
print("K-Means clustering output:")
print(km_result)

# 5️⃣ Compare clusters with actual species
cat("\nComparison of K-Means Clusters vs Actual Species:\n")
print(table(km_result$cluster, iris$Species))

# 6️⃣ Visualize clusters using base R plot
windows() # for Windows users (optional) — opens new plot window
plot(iris_data[, c("Sepal.Length", "Sepal.Width")],
     col = km_result$cluster,
     pch = 19,
     main = "K-Means Clustering (Sepal Dimensions)",
     xlab = "Sepal Length",
     ylab = "Sepal Width")
points(km_result$centers[, c("Sepal.Length", "Sepal.Width")],
       col = 1:3, pch = 8, cex = 2)
grid()

# 7️⃣ Visualize clusters using ggplot2 (Petal dimensions)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

iris_clustered <- cbind(iris, Cluster = as.factor(km_result$cluster))

ggplot(iris_clustered, aes(x = Petal.Length, y = Petal.Width, color = Cluster)) +
  geom_point(size = 3) +
  geom_point(data = as.data.frame(km_result$centers),
             aes(x = Petal.Length, y = Petal.Width),
             color = "black", size = 4, shape = 8) +
  labs(title = "K-Means Clustering on Iris Dataset (Petal Dimensions)",
       x = "Petal Length", y = "Petal Width") +
  theme_minimal()

# 8️⃣ Determine optimal number of clusters (Elbow Method)
wss <- numeric(10)
for (k in 1:10) {
  km <- kmeans(iris_data, centers = k, nstart = 25)
  wss[k] <- km$tot.withinss
}

plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Number of Clusters (K)",
     ylab = "Total Within-Cluster Sum of Squares",
     main = "Elbow Method to Determine Optimal K")
grid()

# 9️⃣ Optional: PCA visualization of clusters
if (!require(cluster)) install.packages("cluster", dependencies = TRUE)
if (!require(factoextra)) install.packages("factoextra", dependencies = TRUE)
library(cluster)
library(factoextra)

fviz_cluster(km_result, data = iris_data,
             geom = "point",
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal(),
             main = "K-Means Clustering Visualization (PCA Projection)")

