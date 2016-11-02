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
        outcomes <- c("heart attack", "heart failure", "pneumonia")
         #state <- "TX" # Debug test value
         #outcome <- "pneumonia" # Debug test value
        valid.state <-match(state, states) # > 0 if state exists
        valid.outcome <- match(outcome, outcomes) # > 0 if outcome valid
        if (valid.state < 1) stop ("state passed as argument is not valid")
        if (valid.outcome < 1) stop ("outcome passed as argument is not valid")
        ## Return hospital name in that state with lowest 30-day death rate
        if (outcome == "heart attack") {
                output <- result[, c(2, 7, 11)] #Hospital name, State, outcome
        }
        if (outcome == "heart failure") {
                output <- result[, c(2, 7, 17)] #Hospital name, State, outcome
        }
        if (outcome == "pneumonia") {
                output <- result[, c(2, 7, 23)] #Hospital name, State, outcome
        }
        
        output <- output[, c(1,3)] # discard State column, no longer needed
        r <- range(as.numeric(output[,2]), na.rm = TRUE) # get the min and max mortality rates
        # the minimum rate corresponds to the best outcome, get the Hospital name from the data frame
        r <- min(r) # use this value to match on to get the 'Best' hospital
        dfnames <- c("Hospital.Name", "outcome")
        names(output) <- dfnames # rename data frame columns
        output <- subset(output, outcome == r, select = 1:2) # limit output to Hospitals with outcome == minimum range
        
        output <- sort(output[1]) # only return first sorted name
        return(output) # return the output
}


## Here is some sample output from the function.
#source("best.R")
#best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
#> best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
#> suppressWarnings(best("TX", "pneumonia"))
#[1] CEDARS-SINAI MEDICAL CENTER
#> best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
#> suppressWarnings(best("PA", "eart failur"))
#Error in if (valid.outcome < 1) stop("outcome passed as argument is not valid") : 
#missing value where TRUE/FALSE needed
##