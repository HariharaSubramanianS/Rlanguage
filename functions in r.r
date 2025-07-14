# Built in function
vec <- c(1, 2, 3, 4, 5)
built_result <- mean(vec)
print(built_result)

# User Defined Function
add_numbers <- function(a, b) {
    return(a + b)
}
print(add_numbers(5, 9))


sub_numbers <- function(a, b) {
    return(a - b)
}
print(sub_numbers(5, 9))

multiply_numbers <- function(a, b) {
    return(a * b)
}
print(multiply_numbers(5, 9))

divide_numbers <- function(a, b) {
    return(a / b)
}
print(divide_numbers(5, 9))