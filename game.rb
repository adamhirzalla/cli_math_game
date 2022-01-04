class Game 

def initialize
  puts "\n-------- Game initialization --------"
  print "\nPlayer 1 name? > "
  input = gets.chomp
  @player1 = Player.new(input)
  print "Player 2 name? > "
  input = gets.chomp
  @player2 = Player.new(input)
  @current = @player1
end

def start
  puts "\n-------- Starting Game --------"
  q = Question.new

  while @player1.lives > 0 && @player2.lives > 0
    puts "\n#{@current.name}'s Turn! (Lives: #{@current.lives}/3)\n\t-> #{q.new_question}"
    answer = gets.chomp.to_i
    if q.is_correct?(answer)
      puts "-> YES! That was correct! Good Job #{@current.name}!"
    else
      @current.wrong
      puts "-> NOPE! That was incorrect! Sorry, #{@current.name}!"
    end
    @current == @player1 ? @current = @player2 : @current = @player1
  end

  if @player2.lives == 0
    puts "\n#{@player1.name} WINS with a score of #{@player1.lives}/3"
  else
    puts "\n#{@player2.name} WINS with a score of #{@player2.lives}/3"
  end
  puts "\n-------- GAME OVER --------"
  exit(0)
end

end