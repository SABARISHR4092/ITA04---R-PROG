sum_func<-function(n){
  total<-0
  for(i in 1:n){
    total<-total+i
  }
  return(total)
}
print(sum_func(60))