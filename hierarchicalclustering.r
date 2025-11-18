# ===============================
# Hierarchical Clustering in R
# ===============================

# 2. Load libraries
library(ggplot2)
library(factoextra)

# 3. Load dataset (Iris)
data <- iris[, 1:4]  # Select numeric features only
head(data)

# 4. Compute Euclidean distance matrix
dist_matrix <- dist(data, method = "euclidean")

# 5. Perform hierarchical clustering (Ward’s method)
hc <- hclust(dist_matrix, method = "ward.D2")

# 6. Plot dendrogram
plot(hc, 
     main = "Hierarchical Clustering Dendrogram (Ward.D2)", 
     xlab = "", 
     sub = "", 
     cex = 0.6)

# 7. Cut the tree into 3 clusters
k <- 3
clusters <- cutree(hc, k = k)

# Add cluster assignment to data
clustered_data <- data
clustered_data$cluster <- as.factor(clusters)

# 8. Display cluster membership
head(clustered_data)

# 9. Compare clusters with actual species
table(clusters, iris$Species)

# 10. Visualize clusters with factoextra
fviz_cluster(list(data = data, cluster = clusters),
             palette = "jco",
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_minimal(),
             main = "Hierarchical Clustering (Iris Dataset)")

# 11. Optional: Visualize dendrogram with cluster rectangles
fviz_dend(hc, 
          k = 3, 
          rect = TRUE, 
          rect_border = "jco", 
          rect_fill = TRUE,
          main = "Dendrogram with Cluster Rectangles")