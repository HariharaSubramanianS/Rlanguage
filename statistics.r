x <- c(5, 7, 8, 8, 10, 12, 13, 14, 17, 20, 22, 22)
# Measure of central tendency

#mean
mean_val <- mean(x)
print(paste("Mean:", mean_val))

#median
medi_val <- median(x)
print(paste("Median:", medi_val))

#mode
mode_func <- function(v){
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_val <- mode_func(x)
print(paste("Mode:", mode_val))

# Measures of Dispersion

#Variance
variance <- var(x)
print(paste("Variance:", variance))

#Standard Deviation
std_dev <- sd(x)
print(paste("Standard Deviation:", std_dev))

#Range
range_val <- range(x)
print(paste("Range:", range_val[1], "to", range_val[2]))

#Interquartile range
iqr_val <- IQR(x)
print(paste("Interquartile Range:", iqr_val))

#Coefficient of Variation 
cv <- sd(x) / mean(x)
print(paste("Coefficient of variation:", round(cv, 4)))

#Measures of Position

#Quantiles
quantiles <- quantile(x)
print("Quantiles:")
print(quantiles)

#Declies
declies <- quantile(x, probs = seq(0, 1, 0.1))
print("Declies:")
print(declies)

#Percentiles
percentiles <- quantile(x, probs = seq(0, 1, 0.25))
print("Percentiles:")
print(percentiles)

#Measures of Frequency

#Frequency table
freq_table <- table(x)
print("Frequency Table:")
print(freq_table)

#Relative Frequencies
rel_feq <- prop.table(freq_table)
print("Relative Frequencies:")
print(rel_feq)

#Cumulative Frequency
cum_freq <- cumsum(freq_table)
print("Cumulative Frequency:")
print(cum_freq)

#Cumulative Relative Frequency
cum_rel_fq <- cumsum(rel_feq)
print("Cumulative Relative Frequency:")
print(cum_rel_fq)