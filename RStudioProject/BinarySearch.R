a <-c(10,20,30,40,50,60,70,90)
binarysearch<-function(a,p) {
  start <- 0
  end<-length(a) + 1
  mid=(start+end)/2
 
  while((a[mid] !=p) && (start < end)) {
    if(p < a[mid]) end = mid
    else start = mid+1
     mid = floor((start+end)/2)
  }
  if(a[mid] == p)
    mid else  -1

}