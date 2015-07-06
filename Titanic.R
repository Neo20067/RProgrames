train <- read.csv("/home/abelia/RProgrames/train.csv")

as <- data.frame(train$Name,train$Age,train$Survived,train$Sex,train$Fare,train$Embarked)
as1 <-na.omit(as)
names(as1) <- c("Name","Age","Survived","Sex", "Fare","Embarked")
c <- table(train$Survived,train$Sex)
library(plyr)
# cm<-count(as1$Survived[as1$Sex == "male"])
# cf <- count(as1$Survived[as1$Sex == "female"])

# transform(as1, Sex= as.numeric(as1$Sex))
asf <- factor(as1$Sex)
asfn <- as.numeric(asf)

em <- factor(as1$Embarked)
emn <- as.numeric(em)

asd <- data.frame(as1$Age,as1$Survived,as1$Sex,as1$Fare,emn)
names(asd) <- c("Age","Survived","Sex","Fare","Embarked")

tr <- cbind(asd,(asd$Age > 18))
names(tr) <- c("Age","Survived","Sex","Fare","Embarked","Child")


tr1 <- factor(tr$Child)
trc <- as.numeric(tr1)
trc[trc == "1"] <- "Child"
trc[trc == "2"] <- "Elder"
trc1 <- trc[trc == "False"] <- "Child"
asdf <- data.frame(as1$Age,as1$Survived,as1$Sex,as1$Fare,emn,trc)
names(asdf) <- c("Age","Survived","Sex","Fare","Embarked","Child")
ag <- aggregate(Survived ~ Child + Sex , data=asdf, FUN=sum)
ads <- table(as1$Sex,as1$Survived)
gs <- data.frame((ads))
names(gs) <- c("Sex","Survived","Count")
gso <- gs[with(gs, order(gs$Sex)), ]

gsos <- factor(gso$Survived)
gsoc <-as.character(gsos)
gsoc[gsoc == "0"] <- "Not Survived"
gsoc[gsoc == "1"] <- "Survived"
gsocf <- data.frame(gso,gsoc)
gsocfo <- gsocf[with(gsocf, order(gsocf$Sex)), ]
names(gsocfo) <- c("Sex","Survived","Count","Survived1")
# Sex Vs Survived
barplot(gsocfo$Count, xlab = "Gender",ylab = "Survived",main = "Gender and Survived",col=rainbow(2),legend=gsocfo$Survived1[1:2],names.arg = gsocfo$Sex)
# .......................................................................................................................
as <- table(trc,as1$Survived)
asdframe <- data.frame(as)
names(asdframe) <- c("Child","Survived","Count")
asdframeo <- asdframe[with(asdframe, order(asdframe$Child)),]
asdframeos <- factor(asdframeo$Survived)
asdframeoc <-as.character(asdframeos)
asdframeoc[asdframeoc == "0"] <- "Not Survived"
asdframeoc[asdframeoc == "1"] <- "Survived"
asdframeof <- data.frame(asdframeo,asdframeoc)
names(asdframeof) <- c("Child","Survived","Count","Survived1")
# Age Vs Survived
# barplot(asdframeof$Count, xlab = "Child or Elder",ylab = "Survived",main = "Age and Survived",col=rainbow(2),legend=asdframeof$Survived1[1:2],names.arg = asdframeof$Child)
# ......................................................................................................................
# Fare Vs Survived
fs <- table(as1$Fare,as1$Survived)
fsd <- data.frame(as1$Fare,as1$Survived)
names(fsd) <- c("Fare","Survived")
fsdr <- cbind(fsd,(fsd$Fare > 50.00))
names(fsdr) <- c("Fare","Survived","Cost")

fsdr1 <- factor(fsdr$Cost)
fsdrc <- as.numeric(fsdr1)
fsdrc[fsdrc == "1"] <- "Low"
fsdrc[fsdrc == "2"] <- "High"
names(fsdrc) <- c("Fare","Survived","Cost")
fsdrcf <- data.frame(fsd$Fare,fsd$Survived,fsdrc)
names(fsdrcf) <- c("Fare","Survived","Cost")
ags <- aggregate(Survived ~ Cost, data=fsdrcf, FUN=sum)
ast <- table(fsdrcf$Survived,fsdrcf$Cost)
astf <- data.frame(ast)
names(astf) <- c("Survived","Fare","Cost")
fsdcs <- factor(astf$Survived)
fsdcsc <-as.character(fsdcs)
fsdcsc[fsdcsc == "0"] <- "Not Survived"
fsdcsc[fsdcsc == "1"] <- "Survived"
astff <- data.frame(ast,fsdcsc)
names(astff) <- c("Survived","Fare","Cost","Survived1")
# hist(fsd$Count,breaks=12,col="red",xlab="Fares",main="Fare Vs Survived")
# Fare Vs Survived
# barplot(astff$Cost, xlab = "Ticket Cost",ylab = "Survived",main = "Ticket Cost and Survived",col=rainbow(2),legend=astff$Survived1[1:2],names.arg = astff$Fare)
# ...........................................................................
# Embarked vs Servived
es <- table(as1$Embarked,as1$Survived)
names(es) <- c("Embarked","Survived","Count")

esd <- data.frame(es)
names(esd) <- c("Embarked","Survived","Count")
esdc <-factor(esd$Survived)
esdcc <- as.character(esdc)
esdcc[esdcc == "0"] <- "Not Survived"
esdcc[esdcc == "1"] <- "Survived"
esdss <- data.frame(esd,esdcc)
names(esdss) <- c("Embarked","Survived","Count","Survivedc")
esdo <- esdss[with(esdss, order(esdss$Embarked)),]
# Embarked Vs Survived
 # barplot(esdo$Count, xlab = "Port",ylab = "Survived",main = "Port and Survived",col=rainbow(2),legend=esdo$Survivedc[1:2],names.arg = esdo$Embarked)


