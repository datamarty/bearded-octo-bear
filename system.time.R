# User time
## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

## Elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i-1,i,"+")
}
x <- hilbert(1000)
system.time(svd(x))
