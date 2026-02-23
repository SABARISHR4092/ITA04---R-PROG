grade <- function(marks) {
  if(marks >= 75) {
    return("Distinction")
  } else if(marks >= 50) {
    return("Pass")
  } else {
    return("Fail")
  }
}
print(grade(68))
