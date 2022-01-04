class Question

def new_question
  num1 = rand(1..20)
  num2 = rand(1..20)
  @answer = num1 + num2
  "What does #{num1} plus #{num2} equal?"
end

def is_correct?(answer)
  @answer == answer
end

end