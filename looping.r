# switch
day <- 2
switch(day,
          "Sunday", "monday","tuesday","wednesday","thursday","friday","saturday")


# Looping

for (i in 1:8) {
    if(i==6){
        next
    }
    print(i)
}


for (i in 1:9){
    if(i == 5){
        break
    }
    print(i)
}

# for loop
cat("using for loop: \n")
for(i in 1:5){
    cat("i=", i, "\n")
}
cat("\n")

#while loop
cat("Using while loop:\n")
i <- 1
while(i <= 5) {
    cat("i=", i, "\n")
    i <- i + 1
}

# Repeat loop
cat("using repeat loop:\n")
i <- 1
repeat{
    cat("i=", i, "\n")
    i <- i + 1
    if(i>5){
        break 
    }
}