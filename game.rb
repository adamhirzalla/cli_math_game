class Game 

  def initialize
    puts "\n-------- Game initialization --------"
    print "\nPlayer 1 name? > "
    name = gets.chomp
    @player1 = Player.new(name)
    print "Player 2 name? > "
    name = gets.chomp
    @player2 = Player.new(name)
  end

  def start
    puts "\n-------- Starting Game --------"
    new_turn
  end

  private

  def new_turn
    @player1.ask
    check_lives
    @player2.ask
    check_lives
    current_score
    puts "\n-------- NEW TURN --------"
    new_turn
  end

  def check_lives
    if @player1.lost?
      winner(@player2)
    elsif @player2.lost?
      winner(@player1)
    end
  end

  def current_score
    puts "\nScore -> #{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def winner(player)
    puts "\n#{player.name} WINS with #{player.lives}/3 lives remaining!"
    puts "\n-------- GAME OVER --------"
    exit(0)
  end

end