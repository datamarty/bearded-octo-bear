# Coursera, John Hopkins University, R-Programming
# Week 2, Programming Asignment 1
#**     Martin Selway       **#
#**     Oct 2016            **#

complete <- function(directory, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the csv files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id   nobs
## 1    117
## 2    1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

        #ids <- c(1,4,17,122) #Debug list of files for testing
        #directory <- "specdata" #Debug directory path for testing
        files <- c()
        ids <- id
        directory <- paste("./", directory, "/", sep = "")
        #Create vectors dependent on file ID passed
        SingleDigit <- ids[ids > 0 & ids < 10]
        DoubleDigit <- ids[ids > 9 & ids < 100]
        TripleDigit <- ids[ids > 99]
        #Append zeros to file if needed
        if(length(SingleDigit) > 0){
                SDFiles <- paste(directory, "00", SingleDigit,".csv", sep = "")
                files <- SDFiles
        }
        if(length(DoubleDigit) > 0){
                DDFiles <- paste(directory, "0", DoubleDigit, ".csv", sep = "")
                files <- c(files, DDFiles)
        }
        if(length(TripleDigit) > 0){
                TDFiles <- paste(directory, TripleDigit, ".csv", sep = "")
                files <- c(files, TDFiles)
        }

        #Read first file to create variables in a data frame
        data <- read.csv(files[1])

        #Read remaining files and rbind them to dataset
        for (f in files[-1]) {
                data <- rbind(data,read.csv(f))

        }
        
        #Implement the logic on the data set
        outdata <- data #nrow(!is.na(data$ID))
        return(head(outdata))
        
}