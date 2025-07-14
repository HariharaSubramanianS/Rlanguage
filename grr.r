# Load inbuilt datasets
data(mtcars)
data(iris)
data(airquality)

# Set up plotting area for multiple plots
par(mfrow = c(2, 2))  # 2 rows, 2 columns

# 1. Scatter Plot (mtcars: mpg vs wt)
plot(mtcars$wt, mtcars$mpg,
     main = "MPG vs Weight (mtcars)",
     xlab = "Weight (1000 lbs)", ylab = "Miles per Gallon",
     col = "blue", pch = 19)

# 2. Boxplot (iris: Sepal.Length by Species)
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Sepal Length by Species (iris)",
        xlab = "Species", ylab = "Sepal Length",
        col = c("tomato", "lightgreen", "skyblue"))

# 3. Histogram (airquality: Ozone)
hist(airquality$Ozone,
     main = "Ozone Distribution (airquality)",
     xlab = "Ozone (ppb)", col = "orange", border = "brown", breaks = 10)

# 4. Line Plot (airquality: Temp over Days)
plot(airquality$Temp, type = "l",
     main = "Temperature Over Days (airquality)",
     xlab = "Day Index", ylab = "Temperature (F)",
     col = "darkgreen", lwd = 2)

# Reset layout
par(mfrow = c(1, 1))

# Bonus: Pairwise Scatterplot Matrix (iris dataset)
pairs(iris[1:4], main = "Scatterplot Matrix (iris)", col = iris$Species)

# Save as PNG (optional)
png("r_visualizations.png", width = 800, height = 600)
par(mfrow = c(2, 2))
plot(mtcars$wt, mtcars$mpg, main = "MPG vs Weight", xlab = "Weight", ylab = "MPG", col = "blue", pch = 19)
boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length by Species", col = c("red", "green", "blue"))
hist(airquality$Ozone, main = "Ozone Histogram", xlab = "Ozone", col = "orange")
plot(airquality$Temp, type = "l", main = "Temperature", ylab = "Temp", col = "darkgreen", lwd = 2)
dev.off()