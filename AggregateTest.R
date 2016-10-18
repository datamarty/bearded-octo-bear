mydata_names <- c("Date", "nitrate", "sulfate", "ID")
data.frame(mydata)
mydates <- c("2010-01-01", "2010-01-02", "2010-01-03", "2010-01-04", "2010-01-05", "2010-01-06")
mysulfate <- c(0, 0.7, 1.3, NA, 2.7, 2.2)
mynitrate <- c(NA, 3.6, 2.1, 4.8, 9.8, 5.7)
myID <- c(1,1,3,2,3,3)
mydata <- data.frame(mydates, mysulfate, mynitrate, myID)

# Rename a column in R
colnames(mydata)[colnames(mydata)=="mydates"] <- "date"
colnames(mydata)[colnames(mydata)=="mysulfate"] <- "sulfate"
colnames(mydata)[colnames(mydata)=="mynitrate"] <- "nitrate"
colnames(mydata)[colnames(mydata)=="myID"] <- "ID"

# Only the complete rows
subset(mydata, complete.cases(mydata))

# Only the incomplete rows
subset(mydata, !complete.cases(mydata))

# Calculate the aggregate number of observations
aggregate(complete.cases(mydata), list(by = mydata$ID), FUN = sum)
