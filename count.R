
 id<-c(1,2,3,4,5,6,7)
 name<-c("raj","tina","yash","juney","minni","manu","ritesh")
 salary<-c(30000,20000,15000,10000,30000,30000,15000)
  details<-data.frame(id,name,salary)
  count<-function(salary)
  {
 ct1<-ct2<-ct3<-ct<-0
sal<-c(details$salary)
for( i in 1:length(sal))
{
if(sal[i]==30000)
ct<-ct+1
else if(sal[i]==20000)
ct1<-ct1+1
else if(sal[i]==15000)
  ct2<-ct2+1
else
  ct3<-ct3+1
}
s<-c(30000,20000,15000,10000)
cot<-c(ct,ct1,ct2,ct3)
det<-data.frame(s,cot)
ax<-barplot(cot,s,ylab="count",xlab="salary",col=c("red", "yellow", "green","blue"),main="count v/s salary",legend=c(30000,20000,15000,10000))

return(ax)
}