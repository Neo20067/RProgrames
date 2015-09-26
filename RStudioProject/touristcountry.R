
library(RJDBC)
drv<-JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver" , "/home/tne/sqljdbc4-2.0.jar" ,identifier.quote="`")
conn <- dbConnect(drv, "jdbc:sqlserver://192.168.0.11\\TECHNOID;databaseName=PTS", "sa", "Design_20")

countries<- dbGetQuery(conn, "select * from Countries")
tourists<- dbGetQuery(conn, "select id,Firstname,countryid,CreateDateTime from Tourists")

z<-data.frame(table(tourists$countryid))
x<-c(z$Var1,z$Freq)



#plot1<-barplot(x,xlab = "countries",ylab="counts",las=2,main="counts v/s countries",axes=TRUE,col=rainbow(20),space=0.2)

#l<-legend("topright",legend=c(countries$Name),cex=0.25,fill=1:5)
#plot2<-hist(x,xlab="countries",ylab="counts",las=2,main="counts v/s countries",col=rainbow(20),breaks=5)
#plot3<-pie(x,col=rainbow(20),main="counts")
lab1<-c(countries$Name)
plot4<-pie3D(x,col=rainbow(20),main="counts",explode=0.2,labels=lab1,labelcex=0.5)
l<-legend("topright",legend=c(countries$Name),cex=0.25,fill=1:5,text.width=.5)
