# S3 Class Student Mark Analysis System
student <- function(id,name,marks){
  structure(list(id=id,name=name,marks=marks),class="Student")
}
total <- function(x) sum(x$marks)
average <- function(x) mean(x$marks)
grade <- function(x){
  a<-average(x)
  if(a>=90)"A"
  else if(a>=75)"B"
  else if(a>=60)"C"
  else if(a>=50)"D"
  else "F"
}
result <- function(x){
  list(Total=total(x),
       Average=average(x),
       Grade=grade(x))
}
print.Student <- function(x){
  cat("ID:",x$id,"\n")
  cat("Name:",x$name,"\n")
  cat("Marks:",x$marks,"\n")
  r<-result(x)
  cat("Total:",r$Total,"\n")
  cat("Average:",r$Average,"\n")
  cat("Grade:",r$Grade,"\n")
}
marks<-c(88,92,81,75,90)
s1<-student(101,"Anu",marks)
print(s1)
highest<-max(s1$marks)
lowest<-min(s1$marks)
cat("Highest:",highest,"\n")
cat("Lowest:",lowest,"\n")
subjects<-c("R","DS","AI","ML","DBMS")
df<-data.frame(subjects,marks)
print(df)
cat("Passed:",all(marks>=50),"\n")
cat("Rank Score:",average(s1),"\n")

#S4 class 
setClass("Student",
         slots=list(id="numeric",name="character",marks="numeric"))
setGeneric("report",function(object)standardGeneric("report"))
setMethod("report","Student",function(object){
  t<-sum(object@marks)
  a<-mean(object@marks)
  g<-if(a>=90)"A" else if(a>=75)"B" else if(a>=60)"C" else "F"
  cat("ID:",object@id,"\n")
  cat("Name:",object@name,"\n")
  cat("Marks:",object@marks,"\n")
  cat("Total:",t,"\n")
  cat("Average:",a,"\n")
  cat("Grade:",g,"\n")
  cat("Highest:",max(object@marks),"\n")
  cat("Lowest:",min(object@marks),"\n")
})
m<-c(85,78,92,88,80)
s<-new("Student",id=1,name="Kiran",marks=m)
report(s)
df<-data.frame(Sub=c("R","AI","ML","DBMS","OS"),Marks=m)
print(df)
cat("Pass:",all(m>=50),"\n")


#Refernce class 
StudentInfo <- setRefClass(
  "StudentInfo",
  fields = list(
    sid = "numeric",
    sname = "character",
    marks = "numeric"
  ),
  
  methods = list(
    
    total = function() sum(marks),
    
    average = function() mean(marks),
    
    grade = function() {
      avg <- average()
      
      if (avg >= 90)
        "A"
      else if (avg >= 75)
        "B"
      else if (avg >= 60)
        "C"
      else
        "F"
    },
    
    display = function() {
      cat("ID:", sid, "\n")
      cat("Name:", sname, "\n")
      cat("Marks:", marks, "\n")
      cat("Total:", total(), "\n")
      cat("Average:", average(), "\n")
      cat("Grade:", grade(), "\n")
    }
  )
)

obj <- StudentInfo$new(
  sid = 101,
  sname = "Rahul",
  marks = c(80, 85, 90, 75, 88)
)

obj$display()


#S3 - Product Case Study

product<-list(
  id=101,
  name="Laptop",
  price=55000
)
class(product)<-"Product"
print.Product<-function(x){
  cat("Product ID:",x$id,"\n")
cat("Product name:",x$name,"\n")
cat("Price:",x$price,"\n")

if(x$price>50000)
  cat("Category:Premium\n")
else
  cat("Category:Budget\n")
}
print(product)

#S4 class - Library 

setClass(
  "Book",
  slots = list(
    title = "character",
    author = "character",
    price = "numeric"
  )
)

book1 <- new(
  "Book",
  title = "Data Science",
  author = "James",
  price = 750
)

cat("Book Title :", book1@title, "\n")
cat("Author :", book1@author, "\n")
cat("Price :", book1@price, "\n")

Car <- setRefClass(
  "Car",

  fields = list(
    model = "character",
    company = "character",
    mileage = "numeric"
  ),

  methods = list(

    category = function() {
      if (mileage >= 20)
        "Fuel Efficient"
      else
        "Standard"
    },

    display = function() {
      cat("Company :", company, "\n")
      cat("Model :", model, "\n")
      cat("Mileage :", mileage, "km/l\n")
      cat("Category :", category(), "\n")
    }
  )
)

c1 <- Car$new(
  model = "Swift",
  company = "Maruti",
  mileage = 23
)

c1$display()

#ReferneceClass 
Car <- setRefClass(
  "Car",
  
  fields = list(
    model = "character",
    company = "character",
    mileage = "numeric"
  ),
  
  methods = list(
    
    category = function() {
      if (mileage >= 20)
        "Fuel Efficient"
      else
        "Standard"
    },
    
    display = function() {
      cat("Company :", company, "\n")
      cat("Model :", model, "\n")
      cat("Mileage :", mileage, "km/l\n")
      cat("Category :", category(), "\n")
    }
  )
)

c1 <- Car$new(
  model = "Swift",
  company = "Maruti",
  mileage = 23
)

c1$display()