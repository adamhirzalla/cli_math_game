class Player 

  attr_reader :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lost?
    @lives == 0
  end

  def ask_and_lost?
    question = Question.new
    puts "\n#{name}'s Turn! (Lives: #{lives}/3)\n\t-> #{question}"
    answer = gets.chomp.to_i
    if question.check?(answer)
      puts "-> YES! That was correct! Good Job #{name}!"
    else
      puts "-> NOPE! That was incorrect! Sorry, #{name}!"
      punish
      lost?
    end
  end

  private

  def punish
    @lives -= 1
  end
  
  end