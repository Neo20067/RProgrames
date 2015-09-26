selectionsort<- function(v) {
  N = length(v)
  for(i in 1:N) {
    min = i
    for(j in i:N) {
      if(v[j] < v[min]) {
        min = j
      }    
    }
    temp = v[i]
    v[i] = v[min]
    v[min] = temp
  }
  return(v)
}
insertionsort <- function(x){
  for(i in 2:(length(x))) {
    value <- x[i]
    j <- i - 1
    while(j >= 1 && x[j] > value) {
      x[j+1] <- x[j]
      j <- j-1
    }
    x[j+1] <- value
  }
  return (x)
} 



n <- sample(1:10000,10000,replace = T)
n1 <- 10000:1
n2 <- 1:10000
# Random Numbers
sstart <- Sys.time()
selsortrandom <- selectionsort(n)
send <-Sys.time()

istart <- Sys.time()
insortrandom <- insertionsort(n)
iend <-Sys.time()

# Reverse Numbers
sstart1 <- Sys.time()
selsortrevrse <- selectionsort(n1)
send1 <- Sys.time()

istart1 <- Sys.time()
insortrevrse <- insertionsort(n1)
iend1 <- Sys.time()


# Sorted Numbers
sstart2 <- Sys.time()
selsorted<- selectionsort(n2)
send2 <- Sys.time()

istart2 <- Sys.time()
insortsoted <- insertionsort(n2)
iend2 <- Sys.time()

# Time Diffrence
sdiff <- (send-sstart)
sdiff1 <-(send1-sstart1)
sdiff2 <-(send2-sstart2)

idiff <- (iend-istart)
idiff1 <-(iend1-istart1)
idiff2 <-(iend2-istart2)

sel <- c(selsortrandom,selsortrevrse,selsorted)
ins <- c(insortrandom,insortrevrse,insortsoted)
sort <- c(sel,ins)
sna <- c("Random","Reverse","Sorted")
sdifftime <- c(sdiff,sdiff1,sdiff2)
sdf <- data.frame(sna,sdifftime)
selec <- c(sdf$sna,sdf$sdifftime)

ina <- c("Random","Reverse","Sorted")
idifftime <- c(idiff,idiff1,idiff2)
idf <- c(ina,idifftime)
idf <- data.frame(ina,idifftime)
insec <- c(idf$ina,idf$idifftime)

dataf <- data.frame(sna,sdifftime,idifftime)


# difftime <- c(sdifftime,idifftime)
# na <- c(sna,ina)
# df <- data.frame(na,difftime)
# combination <- c(df$difftime)

# sortinggrapha<-barplot(combination,xlab="number",ylab="Time Taken",main="Selection & Insertion Sort Time Diffrence ",col=c(rainbow(length(sna))))


dataf1 <- data.frame(sdifftime,idifftime)
names(dataf1) <- c("Selection Sort","Insertion Sort")
barplot(as.matrix(dataf1), main="Selection & Insertion Sort Time Diffrence", ylab= "Time Tacken", beside=TRUE, col=rainbow(3))
legend("topright", c("Random","Reverse","Sorted"), cex=1.0,  bty="n", fill=rainbow(3))




