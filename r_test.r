library(ggplot2)
library(dplyr)

#Type 1 and Type 2 error
set.seed(123)
alpha <- 0.05
sample_size <- 30

#stimulate type 1 error
samples_H0_true <- replicate(1000, t.test(rnorm(sample_size, mean=50)))