require 'pry'

class Game
  attr_accessor :players, :player1_move, :player2_move, :winner, :player1_wins, :player2_wins, :player1_losses, :player2_losses, :player1_log, :player2_log, :numofGames
  def initialize
    @player1 = []
    @player2 = []
    @player1_move = ""
    @player2_move = ""
    @winner = 0
  end
  
  def round(player1name, player1move, player2name, player2move, numofrounds)
    counter = 1
    name1 = player1name
    name2 = player2name
    noname = " "
    @numofGames = numofrounds
    @player1_move = player1move
    @player2_move = player2move
    @player1 = [name1, @player1_move]
    @player2 = [name2, @player2_move]
    @thewinner = 0
    
    until counter > @numofGames
      whowins = Driver.new
      test = whowins.rps_Driver(@player1_move, @player2_move, name1, name2) 
      if test[0] == 1
        @winner = 1
        @winnersName = name1
      elsif test[1] == 1
        @winner = 2
        @winnersName = name2
      else
        @winner = 0
        @winnersName = noname
      end
      @thewinner = @winner
      scoreboard = PlayersScoreboard.new
      scoreboardTracker = scoreboard.players(@thewinner, @winnersName)
      counter += 1
    end
  end
  
  
end
  
class Driver
  attr_accessor :player1wins, :player2wins
  def initialize
  @player1wins = 0
  @player2wins = 0
  end
  
  def rps_Driver(player1, player2, name1, name2)
  @player1_move = player1
  @player2_move = player2
  @player1_name = name1
  @player2_name = name2

  if @player1_move == "rock" && @player2_move == "paper"
  @player2wins = 1 
  end
  if @player1_move == "scissors" && @player2_move == "paper"
  @player1wins = 1
  end
  if @player1_move == "paper" && @player2_move == "paper"
  #no one wins
  end
  if @player1_move == "rock" && @player2_move == "scissors"
  @player1wins = 1 
  end
  if @player1_move == "scissors" && @player2_move == "scissors"
  #no one wins
  end
  if @player1_move == "paper" && @player2_move == "scissors"
  @player2wins = 1
  end
  if @player1_move == "rock" && @player2_move == "rock"
  #no one wins
  end
  if @player1_move == "scissors" && @player2_move == "rock"
  @player2wins = 1
  end
  if @player1_move == "paper" && @player2_move == "rock"
  @player1wins = 1
  end
  if @player1wins == 1
  puts @player1_name +" wins!"
  elsif @player2wins == 1
  puts @player2_name +" wins!"
  else
  puts "tie!"
  end
  return @player1wins, @player2wins
  end
end

class PlayersScoreboard
  attr_accessor :player1_wins, :player2_wins, :player1_losses, :player2_losses, :player1_log, :player2_log, :numofGames, :name
  def initialize
    @player1_wins = 0
    @player1_losses = 0
    @player2_wins = 0
    @player2_losses = 0
    @player1_log = []
    @player2_log = []
    @name = ""
  end
  def players(elWinner, winnersname)
  winner_name = winnersname
  whowon = elWinner
  @name = ""
  if whowon == 1
    @player1_wins += 1
    @player2_losses += 1
    @name = winner_name
    @player1_log = [ @name, @player1_wins, @player1_losses ]
  elsif whowon == 2
    @player2_wins += 1
    @player1_losses += 1
    @name = winner_name
    @player2_log = [ @name, @player2_wins, @player2_losses ]
  else
    puts 'it must have been a draw'
  end
  return @player1_log, @player2_log
  end
end

puts "-" * 60
puts " Rock Paper Scissors" * 3
puts "-" * 60
puts 
puts
puts "How many rounds would you like to play"
numberofrounds = gets.chomp.to_i

checkNumber = numberofrounds % 2

until checkNumber > 0
  
  puts "That doesn't appear to be a valid number of rounds. Please enter an integer (whole number) greater than zero: "
  numberofrounds = gets.chomp.to_i
  checkNumber = numberofrounds % 2
  
end


puts "Player 1 name: "
player1_create = gets.chomp

puts "Player 1 rock, paper, or scissors? "
player1_move_create = gets.chomp.downcase

until player1_move_create == "rock" || player1_move_create == "paper" || player1_move_create  == "scissors"
  puts "Please enter rock, paper, or scissors"
  player1_move_create = gets.chomp.downcase
end

puts "Player 2 name: "
player2_create = gets.chomp

puts "Player 2 rock, paper, or scissors? "
player2_move_create = gets.chomp.downcase

until player2_move_create == "rock" || player2_move_create == "paper" || player2_move_create  == "scissors"
  puts "Please enter rock, paper, or scissors"
  player2_move_create = gets.chomp.downcase
end
puts

newgame = Game.new
newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)

puts
puts "-" * 60
puts " GameOver" * 6
puts "-" * 60
puts 
puts

binding.pry
