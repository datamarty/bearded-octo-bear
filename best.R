## a function called best that take two arguments:
## the 2-character abbreviated name of a state and an outcome name.
## The function reads the outcome-of-care-measures.csv file and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the
## specified outcome in that state

best <- function(state, outcome) {
        ## Read outcome data
        result <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
        ## Check that state and outcome are valid
        states <- unique(result$State) # unique states available
        # state <- "TX" # Debug test value
        valid.state <-match(state, states) # > 0 if state exists
        
        ## Return hospital name in that state with lowest 30-day death rate
        
}


## Here is some sample output from the function.
#> source("best.R")
#> best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#> best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
#> best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
#> best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
#> best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
#> best("NY", "hert attack")
#Error
##