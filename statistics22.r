# Load libraries
library(moments)
library(ggplot2)

# Create output folder if it doesn't exist
if (!dir.exists("image")) {
  dir.create("image")
}

# Sample vectors
x <- c(45, 50, 55, 60, 65, 70, 75, 80, 200)
y <- c(40, 52, 54, 59, 68, 72, 78, 85, 210)

# Correlation
cor_xy <- cor(x, y)
cat("Correlation:", cor_xy, "\n\n")

# Covariance
cov_xy <- cov(x, y)
cat("Covariance:", cov_xy, "\n\n")

# Confidence Interval
mean_x <- mean(x)
sd_x <- sd(x)
n <- length(x)
error_margin <- qt(0.975, df=n-1) * (sd_x / sqrt(n))
ci_lower <- mean_x - error_margin
ci_upper <- mean_x + error_margin
cat("95% CI:", ci_lower, "to", ci_upper, "\n\n")

# Bias
true_mean <- 70
bias <- mean_x - true_mean
cat("Bias:", bias, "\n\n")

# Outlier Detection
iqr_x <- IQR(x)
q1 <- quantile(x, 0.25)
q3 <- quantile(x, 0.75)
lower_bound <- q1 - 1.5 * iqr_x
upper_bound <- q3 + 1.5 * iqr_x
outliers <- x[x < lower_bound | x > upper_bound]
cat("Outliers:", outliers, "\n\n")

# Skewness & Kurtosis
cat("Skewness:", skewness(x), "\n")
cat("Kurtosis:", kurtosis(x), "\n\n")

# Normal Distribution Plot
normal_data <- rnorm(1000, mean=mean_x, sd=sd_x)
p1 <- ggplot(data.frame(normal_data), aes(x=normal_data)) +
  geom_histogram(aes(y=..density..), bins=30, fill='skyblue', color='black') +
  stat_function(fun=dnorm, args=list(mean=mean_x, sd=sd_x), col="red", size=1) +
  ggtitle("Normal Distribution")

# Save Normal Distribution Plot
ggsave("image/normal_distribution.png", plot = p1, width = 6, height = 4)

# Binomial Distribution Plot
binom_data <- dbinom(0:10, size=10, prob=0.5)
png("image/binomial_poisson_distribution.png", width=800, height=400)

# Set up side-by-side plot area
par(mfrow=c(1,2))
barplot(binom_data, names.arg=0:10, col='lightgreen',
        main="Binomial Distribution", xlab="Successes", ylab="Probability")

# Poisson Distribution
poisson_data <- dpois(0:10, lambda=4)
barplot(poisson_data, names.arg=0:10, col='lightcoral',
        main="Poisson Distribution", xlab="Events", ylab="Probability")

dev.off()