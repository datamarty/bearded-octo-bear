corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  ids <- 3 #Debug list of files for testing
  #directory <- "specdata" #Debug directory path for testing
  files <- c()
  
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
  completeData <- data[complete.cases(data),]
  
  return(completeData)
}