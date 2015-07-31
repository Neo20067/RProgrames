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

ddd <- dist(userd,method = "euclidian",diag = TRUE, upper = TRUE, p = 2)

userm <- matrix(c(5,5,2,5,1,4),ncol=2,byrow=TRUE)
colnames(userm) <- c("Snow Crash","Girl with the Dragon Tattoo")
rownames(userm) <- c("Amy","Bill","Jim")
usert <- as.table(userm)

 # dd <- dist(usert,method = "euclidian",diag = TRUE, upper = TRUE, p = 2)
library(plyr)

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
# ndimend[is.na(ndimend)] <- 0
# ndimend$Angelica[is.na(ndimend$Angelica)] <- 0.00
# ndimend$Bill[is.na(ndimend$Bill)] <- 0.00
md <- ManhattanDistance(ndimend$Angelica,ndimend$Angelica)
ed <- EuclideanDistance(ndimend$Angelica,ndimend$Bill)

ndimend1 <- data.frame(Angelica,Bill,chan,Dan,Hailey,Jordyn,Sam,Veronica)
rownames(ndimend1) <- c("Angelica","Bill","chan","Dan","Hailey","Jordyn","Sam","Veronica")

distf <- dist(ndimend1,method = "euclidian",diag = TRUE, upper = TRUE, p = 2)


NearestNeighbor <- function(x){
  am <- as.matrix(distf)
  amf <- data.frame(am[x,])
  colnames(amf) <- c("euclidian")
  amf <- cbind(Row.Names = rownames(amf), amf)
  amfs <- arrange(amf,amf$euclidian)
  amfs$euclidian[amfs$euclidian == 0] <- NA
  amn <- na.omit(amfs)
  return (amn)
}
KNearestNeighbor <- function(x,y){
  tt<- NearestNeighbor(x)
  top <-head(tt,y)
  return(top)
}

recommend <- function(X){
 
}
# Angelica
mdaa <- ManhattanDistance(ndimend1$Angelica,ndimend1$Angelica)
mdab <- ManhattanDistance(ndimend1$Angelica,ndimend1$Bill)
mdac <- ManhattanDistance(ndimend1$Angelica,ndimend1$chan)
mdad <- ManhattanDistance(ndimend1$Angelica,ndimend1$Dan)
mdah <- ManhattanDistance(ndimend1$Angelica,ndimend1$Hailey)
mdaj <- ManhattanDistance(ndimend1$Angelica,ndimend1$Jordyn)
mdas <- ManhattanDistance(ndimend1$Angelica,ndimend1$Sam)
mdav <- ManhattanDistance(ndimend1$Angelica,ndimend1$Veronica)
# Bill
mdba1 <- ManhattanDistance(ndimend1$Bill,ndimend1$Angelica)
mdbb <- ManhattanDistance(ndimend1$Bill,ndimend1$Bill)
mdbc <- ManhattanDistance(ndimend1$Bill,ndimend1$chan)
mdbd <- ManhattanDistance(ndimend1$Bill,ndimend1$Dan)
mdbh <- ManhattanDistance(ndimend1$Bill,ndimend1$Hailey)
mdbj <- ManhattanDistance(ndimend1$Bill,ndimend1$Jordyn)
mdbs <- ManhattanDistance(ndimend1$Bill,ndimend1$Sam)
mdbv <- ManhattanDistance(ndimend1$Bill,ndimend1$Veronica)
# chan
mdca <- ManhattanDistance(ndimend1$chan,ndimend1$Angelica)
mdcb <- ManhattanDistance(ndimend1$chan,ndimend1$Bill)
mdcc <- ManhattanDistance(ndimend1$chan,ndimend1$chan)
mdcd <- ManhattanDistance(ndimend1$chan,ndimend1$Dan)
mdch <- ManhattanDistance(ndimend1$chan,ndimend1$Hailey)
mdcj <- ManhattanDistance(ndimend1$chan,ndimend1$Jordyn)
mdcs <- ManhattanDistance(ndimend1$chan,ndimend1$Sam)
mdcv <- ManhattanDistance(ndimend1$chan,ndimend1$Veronica)
# Dan
mdda <- ManhattanDistance(ndimend1$Dan,ndimend1$Angelica)
mddb <- ManhattanDistance(ndimend1$Dan,ndimend1$Bill)
mddc <- ManhattanDistance(ndimend1$Dan,ndimend1$chan)
mddd <- ManhattanDistance(ndimend1$Dan,ndimend1$Dan)
mddh <- ManhattanDistance(ndimend1$Dan,ndimend1$Hailey)
mddj <- ManhattanDistance(ndimend1$Dan,ndimend1$Jordyn)
mdds <- ManhattanDistance(ndimend1$Dan,ndimend1$Sam)
mddv <- ManhattanDistance(ndimend1$Dan,ndimend1$Veronica)
# Hailey
mdha <- ManhattanDistance(ndimend1$Hailey,ndimend1$Angelica)
mdhb <- ManhattanDistance(ndimend1$Hailey,ndimend1$Bill)
mdhc <- ManhattanDistance(ndimend1$Hailey,ndimend1$chan)
mdhd <- ManhattanDistance(ndimend1$Hailey,ndimend1$Dan)
mdhh <- ManhattanDistance(ndimend1$Hailey,ndimend1$Hailey)
mdhj <- ManhattanDistance(ndimend1$Hailey,ndimend1$Jordyn)
mdhs <- ManhattanDistance(ndimend1$Hailey,ndimend1$Sam)
mdhv <- ManhattanDistance(ndimend1$Hailey,ndimend1$Veronica)
# Jordyn
mdja <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Angelica)
mdjb <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Bill)
mdjc <- ManhattanDistance(ndimend1$Jordyn,ndimend1$chan)
mdjd <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Dan)
mdjh <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Hailey)
mdjj <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Jordyn)
mdjs <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Sam)
mdjv <- ManhattanDistance(ndimend1$Jordyn,ndimend1$Veronica)
# Sam
mdsa <- ManhattanDistance(ndimend1$Sam,ndimend1$Angelica)
mdsb <- ManhattanDistance(ndimend1$Sam,ndimend1$Bill)
mdsc <- ManhattanDistance(ndimend1$Sam,ndimend1$chan)
mdsd <- ManhattanDistance(ndimend1$Sam,ndimend1$Dan)
mdsh <- ManhattanDistance(ndimend1$Sam,ndimend1$Hailey)
mdsj <- ManhattanDistance(ndimend1$Sam,ndimend1$Jordyn)
mdss <- ManhattanDistance(ndimend1$Sam,ndimend1$Sam)
mdsv <- ManhattanDistance(ndimend1$Sam,ndimend1$Veronica)

# Veronica
mdva <- ManhattanDistance(ndimend1$Veronica,ndimend1$Angelica)
mdvb <- ManhattanDistance(ndimend1$Veronica,ndimend1$Bill)
mdvc <- ManhattanDistance(ndimend1$Veronica,ndimend1$chan)
mdvd <- ManhattanDistance(ndimend1$Veronica,ndimend1$Dan)
mdvh <- ManhattanDistance(ndimend1$Veronica,ndimend1$Hailey)
mdvj <- ManhattanDistance(ndimend1$Veronica,ndimend1$Jordyn)
mdvs <- ManhattanDistance(ndimend1$Veronica,ndimend1$Sam)
mdvv <- ManhattanDistance(ndimend1$Veronica,ndimend1$Veronica)

mdd <- data.frame(mdaa,mdab,mdac,mdad,mdah,mdaj,mdas,mdav)
colnames(mdd) <- c("Angelica","Bill","chan","Dan","Hailey","Jordyn","Sam","Veronica")

mdd <- rbind(mdd,data.frame(Angelica=mdba1,Bill=mdbb,chan=mdbc,Dan=mdbd,Hailey=mdbh,Jordyn=mdbj,Sam=mdbs,Veronica=mdbv))
mdd <- rbind(mdd,data.frame(Angelica=mdca,Bill=mdcb,chan=mdcc,Dan=mdcd,Hailey=mdch,Jordyn=mdcj,Sam=mdcs,Veronica=mdcv))
mdd <- rbind(mdd,data.frame(Angelica=mdda,Bill=mddb,chan=mddc,Dan=mddd,Hailey=mddh,Jordyn=mddj,Sam=mdds,Veronica=mddv))
mdd <- rbind(mdd,data.frame(Angelica=mdha,Bill=mdhb,chan=mdhc,Dan=mdhd,Hailey=mdhh,Jordyn=mdhj,Sam=mdhs,Veronica=mdhv))
mdd <- rbind(mdd,data.frame(Angelica=mdja,Bill=mdjb,chan=mdjc,Dan=mdjd,Hailey=mdjh,Jordyn=mdjj,Sam=mdjs,Veronica=mdjv))
mdd <- rbind(mdd,data.frame(Angelica=mdsa,Bill=mdsb,chan=mdsc,Dan=mdsd,Hailey=mdsh,Jordyn=mdsj,Sam=mdss,Veronica=mdsv))
mdd <- rbind(mdd,data.frame(Angelica=mdva,Bill=mdvb,chan=mdvc,Dan=mdvd,Hailey=mdvh,Jordyn=mdvj,Sam=mdvs,Veronica=mdvv))

rownames(mdd) <- c("Angelica","Bill","chan","Dan","Hailey","Jordyn","Sam","Veronica")

mddc <- mdd
rownames(mddc) <- c("Blues Traveler","Broken Bells","Deadmau5","Norah Jones","Phoenix","Slightly Stoopid","The Strokes","Vampire Weekend")

MNNearestNeighbor <- function(x){
  am <- as.matrix(mdd)
  amf <- data.frame(am[x,])
  colnames(amf) <- c("manhattan")
  amf <- cbind(Row.Names = rownames(amf), amf)
  amfs <- arrange(amf,amf$manhattan)
  amfs$manhattan[amfs$manhattan == 0] <- NA
  amn <- na.omit(amfs)
  return (amn)
}

KMNNearestNeighbor <- function(x,y){
  tt<- MNNearestNeighbor(x)
  top <-head(tt,y)
  return(top)
}
recommend <- function(x1){
  nn1 <-KMNNearestNeighbor(x1,1)
  z <- eval(( text=paste(nn1$Row.Names)))
  ndimend<- cbind(Row.Names = rownames(ndimend), ndimend)
  ss<- subset(ndimend,select =c("Row.Names",x1,z))
  ar <- arrange(ss,ss[x1],ss[z])
  nacount <- sum(is.na(ar[x1]))
  tt <- tail(ar,nacount)
  tt[,2][is.na(tt[,2])] <- tt[,3]
  tt1 <- data.frame(tt$Row.Names,tt[,2],na.rm=TRUE)
  names(tt1) <- c("Names",x1)
   tt2 <- na.omit(tt1[,1:2])
  return(tt2)
}
