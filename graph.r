
data(mtcars)
data(iris)
data(airquality)

par(mfrow = c(2, 2))

#scatter plot
plot(mtcars$wt, mtcars$mpg,
main = "MPG vs Weight (mtcars)",
xlab = "Weight (1000 lbs)", ylab = "Miles per gallon",
col = "blue", pch = 19)

#Boxplot
boxplot(Sepal.Length ~ Species, data = iris,
main = "Sepal length by species (iris)",
xlab = "Species", ylab = "Sepal Length",
col = c("tomato", "lightgreen", "skyblue"))

#Histogram
hist(airquality$Ozone,
main = "ozone Distribution (airquality)",
xlab = "ozone (ppb)", col = "orange", border = "brown", breaks = 10)

#Line plot
plot(airquality$Temp, type = "l",
main = "Temperature over Days (airquality)",
xlab = "Day index", ylab = "Temperature (F)",
col = "darkgreen", lwd = 2)

#reset layout
par(mfrow = C(1, 1))

pairs(iris[1:4], main = "Scatterplot Matrix (iris)", col = iris$Species)

#save as png
png("r_visualization.png", width = 800, height = 600)
par(mfrow = c(2, 2))
plot(mtcars$wt, mtcars$mpg, main = "MPG vs Weight", xlab = "weight", ylab = "MPG", col = "blue", pch =19)
boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length by species", col = c("red", "green", "blue"))
hist(airquality$Ozone, main = "Ozone Histogram", xlab = "Ozone", col = "orange")
plot(airquality$Temp, type = "1", main = "Temperature", ylab = "Temp", col = "darkgreen", lwd = 2)
dev.off()