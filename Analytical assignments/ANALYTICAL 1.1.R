#CREATE STUDENT DATA 
names <- c("Arun", "Bala", "Charan", "Divya", "Esha")

# Marks
math <- c(85, 70, 90, 60, 75)
physics <- c(80, 65, 88, 55, 72)
chemistry <- c(78, 60, 92, 58, 70)

#CALCULATE PASS/FAIL
pass_status <- (math >= 50 & physics >= 50 & chemistry >= 50)

pass_status

#CONVERTING THE ABOVE INTO DATAFRAME 
students <- data.frame(
  Name = names,
  Mathematics = math,
  Physics = physics,
  Chemistry = chemistry,
  Pass = pass_status
)

students

str(students)

#MARKS MATRIX 
marks_matrix <- matrix(
  c(math, physics, chemistry),
  nrow = 5,
  ncol = 3
)

colnames(marks_matrix) <- c("Math", "Physics", "Chemistry")

marks_matrix

#STUDENT TOTAL MARK (ROW)
rowSums

#SUBJECT AVERAGE (COLUMN)
colMeans(marks_matrix)

#CONVERTING INTO FACTOR 
students$Pass <- factor(students$Pass,
                        levels = c(TRUE, FALSE),
                        labels = c("Pass", "Fail"))

students

#ADD TOTAL AND AVERAGE
students$Total <- rowSums(marks_matrix)
students$Average <- students$Total / 3

students

ls()#VIEW OBJ 

rm(math) #REMOVE ONE OBJECT 

rm(list = ls())#REMOVE ALL OBJECT 