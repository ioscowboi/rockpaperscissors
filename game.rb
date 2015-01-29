require 'pry'

class Game
  attr_accessor :players, :player1_move, :player2_move
  def initialize
    @player1 = []
    @player2 = []
    @player1_move = ""
    @player2_move = ""
  end
  
  def round(player1name, player1move, player2name, player2move)
    counter = 1
    name1 = player1name
    name2 = player2name
    @player1_move = player1move
    @player2_move = player2move
    @player1 = [name1, @player1_move]
    @player2 = [name2, @player2_move]
    
    if counter == 1
      whowins = Driver.new
      test = whowins.rps_Driver(@player1_move, @player2_move) 
      if test[0] == 1
        @winner = 1
      elsif test[1] == 1
        @winner = 2
      else
        'no one wins'
      end
    end
  end
  
  
end
  
class Driver
  attr_accessor :player1wins, :player2wins, :player1, :player2
  def initialize
  @player1wins = 0
  @player2wins = 0
  @player1 = ""
  @player2 = ""
  end
  
  def rps_Driver(player1, player2)
  @player1 = player1
  @player2 = player2

  if @player1 == "rock" && @player2 == "paper"
  @player2wins = 1 
  end
  if @player1 == "scissors" && @player2 == "paper"
  @player1wins = 1
  end
  if @player1 == "paper" && @player2 == "paper"
  #no one wins
  end
  if @player1 == "rock" && @player2 == "scissors"
  @player1wins = 1 
  end
  if @player1 == "scissors" && @player2 == "scissors"
  #no one wins
  end
  if @player1 == "paper" && @player2 == "scissors"
  @player2wins = 1
  end
  if @player1 == "rock" && @player2 == "rock"
  #no one wins
  end
  if @player1 == "scissors" && @player2 == "rock"
  @player2wins = 1
  end
  if @player1 == "paper" && @player2 == "rock"
  @player1wins = 1
  end
  if @player1wins == 1
  puts "player 1 wins!"
  elsif @player2wins == 1
  puts "player 2 wins"
  else
  puts "tie!"
  end
  return @player1wins, @player2wins
  end
end

def players(player1, player2, p1move, p2move)
  @player1_move << player1, p1move
  @player2_move << player2, p2move
end



binding.pry
