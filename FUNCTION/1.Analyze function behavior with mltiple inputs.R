add_analyze<-function(a,b,c){
  result<-a+b+c
  if(result>50){
    return("High Value")
  }else{
    return("Low value")
  }
}
x<-add_analyze(10,6,30)
print(x)