library(DBI)
library(rJava)
library(RJDBC)
drv<-JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver" , "/home/abelia/RProgrames/sqljdbc4-2.0.jar" ,identifier.quote="`")
conn <- dbConnect(drv, "jdbc:sqlserver://192.168.0.11\\TECHNOID;databaseName=PTS", "sa", "Design_20")
countries <-dbGetQuery(conn,"select * from Countries")
tourists<- dbGetQuery(conn, "select *  from Tourists")

tc<- merge(tourists,countries, by.CountryId = "tourists$CountryId",by.ID="countries$ID")



