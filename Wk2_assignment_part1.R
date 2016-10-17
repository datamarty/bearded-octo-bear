## pollutantmean <- function(directory = "../Downloads/specdata/", pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the csv files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate"

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors listed
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result
d1 <- read.csv(paste(directory, "001.csv", sep = "")
               nrow(!is.na(d1$sulfate))
               
}