ManhattanDistance <- function(x,y){
  z<- na.omit(x-y)
  s <- sum(abs(z))
  return(s)
}

EuclideanDistance <- function(x,y){
  z <- na.omit((x-y)^2)
  s <- sum(z)
  sr <- sqrt(s)
  return(sr)
}

user <-c("Amy","Bill","Jim")
drogn <-c(5,5,4)
snow <- c(5,2,1)
userd <- data.frame(snow,drogn)
colnames(userd) <- c("Snow Crash","Girl with the Dragon Tattoo")
rownames(userd) <- c("Amy","Bill","Jim")

# ddd <- dist(userd,method = "euclidian",diag = TRUE, upper = TRUE, p = 2)

userm <- matrix(c(5,5,2,5,1,4),ncol=2,byrow=TRUE)
colnames(userm) <- c("Snow Crash","Girl with the Dragon Tattoo")
rownames(userm) <- c("Amy","Bill","Jim")
usert <- as.table(userm)

 # dd <- dist(usert,method = "euclidian",diag = TRUE, upper = TRUE, p = 2)


# N-dimensional thinking
Angelica <- c(3.5,2,NA,4.5,5,1.5,2.5,2)
Bill <- c(2,3.5,4,NA,2,3.5,NA,3)
chan <- c(5,1,1,3,5,1,NA,NA)
Dan <- c(3,4,4.5,NA,3,4.5,4,2)
Hailey <- c(NA,4,1,4,NA,NA,4,1)
Jordyn <- c(NA,4.5,4,5,5,4.5,4,4)
Sam <- c(5,2,NA,3,5,4,5,NA)
Veronica <- c(3,NA,NA,5,4,2.5,3,NA)

ndimend <- data.frame(Angelica,Bill,chan,Dan,Hailey,Jordyn,Sam,Veronica)
rownames(ndimend) <- c("Blues Traveler","Broken Bells","Deadmau5","Norah Jones","Phoenix","Slightly Stoopid","The Strokes","Vampire Weekend")

# ndimend$Angelica[is.na(ndimend$Angelica)] <- 0.00
# ndimend$Bill[is.na(ndimend$Bill)] <- 0.00
md <- ManhattanDistance(ndimend$Angelica,ndimend$Bill)
ed <- EuclideanDistance(ndimend$Angelica,ndimend$Bill)

