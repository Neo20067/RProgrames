library(DBI)
library(rJava)
library(RJDBC)
drv<-JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver" , "/home/abelia/RProgrames/sqljdbc4-2.0.jar" ,identifier.quote="`")
conn <- dbConnect(drv, "jdbc:sqlserver://192.168.0.11\\TECHNOID;databaseName=PTS", "sa", "Design_20")
touristcount<- dbGetQuery(conn, "select c.Name ,count(ts.countryId) COUNT from Tourists ts INNER JOIN Countries c ON ts.CountryId=c.ID group by c.Name")
pt <-data.frame(touristcount)
# 
attach(touristcount)
# # pt <- table(patientregistration$DEPARTMENTID)
# # barplot(pt,col = c("red","blue","green","yellow"),xlab = "DepartmentId",ylab = "Count", main = "PatientRegistration Department Id  Count",legend=rownames(pt))
# 
# library(plyr)
# pt1 <- count(patientregistration$DEPARTMENTID)
# names(pt1)[1] <- "DEPARTMENTID"
# names(pt1)[2] <- "COUNT"
 barplot(COUNT,col = c("red","blue","green","yellow"), xlab = "Country Names",ylab = "Count", main = "Tourist Visiting Country",legend=pt$Name,names.arg = pt$Name)
#





 