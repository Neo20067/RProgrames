library(DBI)
library(rJava)
library(RJDBC)
drv<-JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver" , "/home/abelia/RProgrames/sqljdbc4-2.0.jar" ,identifier.quote="`")
conn <- dbConnect(drv, "jdbc:sqlserver://192.168.0.105\\TECHNOID;databaseName=WEBHIMS", "sa", "Design_20")
patientregistration<- dbGetQuery(conn, "select * from mstPATIENTREGISTRATION")
pt <-data.frame(patientregistration, na.omit = FALSE)


# pt <- table(patientregistration$DEPARTMENTID)
# barplot(pt,col = c("red","blue","green","yellow"),xlab = "DepartmentId",ylab = "Count", main = "PatientRegistration Department Id  Count",legend=rownames(pt))

library(plyr)
pt1 <- count(patientregistration$DEPARTMENTID)
names(pt1)[1] <- "DEPARTMENTID"
names(pt1)[2] <- "COUNT"
barplot(pt1$COUNT,col = c("red","blue","green","yellow"), xlab = "DepartmentId",ylab = "Count", main = "PatientRegistration Department Id  Count",legend=rownames(pt1),names.arg = rownames(pt1))






