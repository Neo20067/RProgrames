# Calculating the mean and standard deviatio
x <- c(1,2,3,4,5,6,7,8)
sd1 <- function(x){
  n <- length(x)
  meanx <- sum(x)/n
  css <- sum((x - meanx)^2)
  sdx <- sqrt(css / (n-1))
  return (sdx)
}

oddcount <- function(x){
  k<-0
   for(n in x) {
     if(n %% 2 ==1)
     k <- k+1
     }
  return (k)
}

m1 <- matrix(1:4,nrow = 2,ncol = 2)
m2 <- matrix(5:8,nrow = 2,ncol = 2)

mul <-function (m1,m2){
  m <- m1 * m2
  return (m)
}

a <- c(1,2,3,10,20,30,40,50)
ad <- data.frame(a)
aa <- function(ad){
 ad[ad >=(1:10)] <-1
 
}

ag <-asd $Age
aged <- data.frame(ag)
aa <-function(a){
  a1 <- a
  r1 <-  a1[a1 < (1:9)] <- 1
  r2 <-  a1[a1 < (10:19)] <- 2
  r3 <-  a1[a1 < (20: 29)] <- 3
  r4 <-  a1[a1 < (30 :39)] <- 4
  r5 <-  a1[a1 < (40:100)] <- 5
  # result <- table(a1)
  return (list(r1,r2,r3,r4,r5))
}
aaa<- aa(aged)
aad <- data.frame(aaa)



