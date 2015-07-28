train <- read.csv("/home/abelia/RProgrames/train.csv")
as11<- data.frame(train$Name,train$Age,train$Survived,train$Sex,train$Fare,train$Embarked)
as<- data.frame(train$Name,train$Age,train$Survived,train$Sex,train$Fare,train$Embarked)
library(plyr)
# as$train.Age[is.na(as$train.Age)] <- 0.00
# mm <-mean(as$train.Age)
# mmr <- round(mm,digits = 0)
# as$train.Age[as$train.Age == 0.00] <- mmr
mmd <-median(as$train.Age,na.rm=TRUE)
as$train.Age[is.na(as$train.Age)] <- mmd

sx <- factor(as$train.Sex)
Sex <- as.numeric(sx) 

ed <- factor(as$train.Embarked)
Port <- as.numeric(ed)

as1<- data.frame(train$Name,train$Age,train$Survived,Sex,train$Fare,Port)
md <-median(as1$train.Age,na.rm=TRUE)
as1$train.Age[is.na(as1$train.Age)] <- md
names(as1) <- c("Name","Age","Survived","Sex", "Fare","Port")

library(modeest)
mode <-mlv(as1$Port,method = "discrete")
modev <- as.numeric.mlv(mode)
as1$Port[as1$Port == 1] <- modev

