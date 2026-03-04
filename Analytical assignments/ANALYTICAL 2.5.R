# ONLINE QUIZ EVALUATION SYSTEM

# Correct answers
correct_answers <- c("A","C","B","D","A")

# Students' answers (each row = one student)
student_answers <- list(
  c("A","C","B","D","A"),
  c("A","C","X","D","A"),
  c("A","C","B","CHEAT","A")
)

# Function to evaluate quiz
evaluate_quiz <- function(answers_list, correct, 
                          marks_correct = 5, 
                          marks_wrong = -1){
  
  results <- list()
  
  for(i in 1:length(answers_list)){
    
    answers <- answers_list[[i]]
    total_score <- 0
    j <- 1
    
    while(j <= length(correct)){
      
      # Stop evaluation if cheating detected
      if(answers[j] == "CHEAT"){
        cat("Cheating detected for Student", i, "\n")
        break
      }
      
      # Skip invalid entries
      if(!(answers[j] %in% c("A","B","C","D"))){
        j <- j + 1
        next
      }
      
      # Compare answers using if-else
      if(answers[j] == correct[j]){
        total_score <- total_score + marks_correct
      } else {
        total_score <- total_score + marks_wrong
      }
      
      j <- j + 1
    }
    
    percentage <- (total_score / (length(correct) * marks_correct)) * 100
    
    if(percentage >= 50){
      status <- "Pass"
    } else {
      status <- "Fail"
    }
    
    # Store result as complex object
    results[[i]] <- list(
      Total_Score = total_score,
      Percentage = percentage,
      Result = status
    )
  }
  
  return(results)
}

# Call function
quiz_results <- evaluate_quiz(student_answers, correct_answers)

quiz_results