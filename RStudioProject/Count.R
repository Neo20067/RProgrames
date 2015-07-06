id<-c(1,2,3,4,5,6,7)
name<-c("krishna","venkat","srinu","rajesh","ramesh","bharth","raviteja")
salary<-c(30000,20000,15000,10000,30000,30000,15000)
employee<-data.frame(id,name,salary)
count<-function(salary){
  ct<-0
  sal<-c(employee$salary)
  for( i in 1:length(sal)){
    if(sal[i]==salary)
      ct<-ct+1
  }
  return(ct)
}
