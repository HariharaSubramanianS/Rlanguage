# Install required libraries (sf, if not present)
# -----------------------------------------

required_packages <- c("sf")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org", character.only = TRUE)
    library(pkg, character.only = TRUE)
  }
}

# -----------------------------------------
# Generate spatial points
# -----------------------------------------

set.seed(123)
n_points <- 100
x <- runif(n_points, 0, 100)
y <- runif(n_points, 0, 100)
points_sf <- st_as_sf(data.frame(x = x, y = y), coords = c("x", "y"), crs = 4326)

# -----------------------------------------
# Compute MBR (Minimum Bounding Rectangle)
# -----------------------------------------

mbr <- st_as_sfc(st_bbox(points_sf))

# Simple Quadtree-like division (1 level only)
# -----------------------------------------

x_mid <- mean(range(x))
y_mid <- mean(range(y))

# -----------------------------------------
# Save plot to file
# -----------------------------------------

png("mbr-quadtree.png", width = 800, height = 800)

plot(st_geometry(points_sf), main = "MBR and Quadtree (Level 1)", col = "blue", pch = 20)
plot(mbr, border = "red", lwd = 2, add = TRUE)
abline(v = x_mid, col = "darkgreen", lty = 2)
abline(h = y_mid, col = "darkgreen", lty = 2)
legend("topright",
       legend = c("Points", "MBR", "Quadtree Division"),
       col = c("blue", "red", "darkgreen"),
       lty = c(NA, 1, 2),
       pch = c(20, NA, NA))

dev.off()

cat("Plot saved as 'mbr_quad3.png'\n")