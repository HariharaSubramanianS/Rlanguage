num_val <- 3.14
print("Numeric:")
print(num_val)
print(class(num_val))

int_val <- as.integer(10)
print("Integer:")
print(int_val)
print(class(int_val))

char_val <- "Hello, R"
print("character:")
print(char_val)
print(class(char_val))

log_val <- TRUE
print("Logical:")
print(log_val)
print(class(log_val))

complex_val <- 2+3i
print("Complex:")
print(complex_val)
print(class(complex_val))

raw_val <- charToRaw("ABC")
print("Raw:")
print(raw_val)
print(class(raw_val))

null_val <- c(1, 2, NA, 4)
print("NA:")
print(null_val)
print(is.na(null_val))

nan_val <- 0/0
print("NaN:")
print(nan_val)
print(is.nan(nan_val))

inf_val <- 10/0
print("Infinity:")
print(inf_val)
print(is.infinite(inf_val))

vec <- c(1, 2, 3)
print("Vector")
print(vec)
print(class(vec))

my_list <- list(name="jhon", age= 30, scores= c(60, 90))
print("List")
print(my_list)
print(class(my_list))

mat <- matrix(1:6, nrow=2, ncol= 3)
print("Matrix")
print(mat)
print(class(mat))

arr <- array(1:8, dim= c(2, 2, 2))
print("Array")
print(arr)
print(class(arr))

factor_val <- factor(c("low", "medium", "high", "medium"))
print("Factor")
print(factor_val)
print(levels(factor_val))
print(class(factor_val))

df <- data.frame(
    Name = c("santhosh", "dilliganesh"),
    Score = c(70,100),
    Passed = c(TRUE, TRUE)
)
print("Data frame")
print(df)
print(class(df))
