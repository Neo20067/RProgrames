mergesort <- function(m)
{
  merge_ <- function(left, right)
  {
    result <- c()
    while(length(left) > 0 && length(right) > 0)
    {
      if(left[1] <= right[1])
      {
        result <- c(result, left[1])
        left <- left[-1]
      } else
      {
        result <- c(result, right[1])
        right <- right[-1]
      }         
    }
    if(length(left) > 0) result <- c(result, left)
    if(length(right) > 0) result <- c(result, right)
    result
  }
  
  len <- length(m)
  if(len <= 1) m else
  {
    middle <- length(m) / 2
    left <- m[1:floor(middle)]
    right <- m[floor(middle+1):len]
    left <- mergesort(left)
    right <- mergesort(right)
    if(left[length(left)] <= right[1])
    {
      c(left, right)
    } else
    {
      merge_(left, right)
    } 
  }
}

n <- sample(1:10000,10000,replace = T)
n1 <- 10000:1
n2 <- 1:1000
# Random Numbers
mstart <- Sys.time()
mersortrandom <- mergesort(n)
mend <-Sys.time()
# Reverse Numbers
mstart1 <- Sys.time()
mersortrevrse <- mergesort(n1)
mend1 <- Sys.time()
# Sorted Numbers
mstart2 <- Sys.time()
mersorted<- mergesort(n2)
mend2 <- Sys.time()

# Time Diffrence
mdiff <- (mend-mstart)
mdiff1 <-(mend1-mstart1)
mdiff2 <-(mend2-mstart2)

mer <- c(mersortrandom,mersortrevrse,mersorted)

mna <- c("Random","Reverse","Sorted")
mdifftime <- c(mdiff,mdiff1,mdiff2)
mdf <- data.frame(mna,mdifftime)