# Martin Selway
# setwd("C:/Users/mselway/Documents/RCode/Coursera/ProgrammingR/wk4")
outcome <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
dim(outcome)
str(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[,11])
outcome[, 11]
hist(outcome[, 11])

# Number of occurences of State
tapply(outcome$Provider.Number, outcome$State, function(x) length(unique(x)))
