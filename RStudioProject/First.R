sum1 <- function(a, b){
  return (a+b)
}
swap <- function(a,b) {
  b <- a+b
  a <- b-a
  b <- b-a
  a <- c(a,b)
  return (a)
}