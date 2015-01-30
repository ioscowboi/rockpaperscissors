require 'pry'

# class Game initializes the array for players, players moves, and the successful winner
# the round method recieves the players names and moves from the initialize method. These data are fed into the counter to test who will win the round
# the "until" counter will run the loop for the number of rounds elected by the players
# the until counter will also call the PlayersScoreboard class for each round to add the wins/losses to the two players total score
# the until counter also determines who will win by running a series of tests; when the test array (defined below) = 1, player 1 wins, when it = 2, player 2 wins.
# whowins is a local variable that stores the initialized object "Driver" instance
# test is a local variable that stores the result of who wins the given round using the Driver instance's method called rps_Driver
# test takes four arguments: player 1 move, player 1 name, player 2 move, player 2 name to determine the result of each round (this could be simplified)
# the scoreboard local variable calls the PlayersScoreboard class and store a new object instance of it
# then, scoreboardTracker calls the "players" method of PlayersScoreboard taking two arguments: the winner result (1 or 2) of the test array position 0, and the winners name
# counter is a local variable that counts the number of rounds played until it matches the number of games declared by the user

#didsomeonewin tracks the return value from the round method in the Game class. Depending on its value (0, 1, or 2),
#p1 or p2 gets the value. 

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
    nowinner = " "
    @numofGames = numofrounds
    @player1_move = player1move
    @player2_move = player2move
    @player1 = [name1, @player1_move]
    @player2 = [name2, @player2_move]
    @thewinner = 0
    

      whowins = RPSGameRules.new
      test = whowins.rps_Rules(@player1_move, @player2_move, name1, name2) 
      if test[0] == 1
        @winner = 1
        @winnersName = name1
      elsif test[1] == 1
        @winner = 2
        @winnersName = name2
      else
        @winner = 0
        @winnersName = nowinner
      end
      @thewinner = @winner
      scoreboard = PlayersScoreboard.new
      scoreboardTracker = scoreboard.players(@thewinner, @winnersName)
      return @thewinner
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
    puts 'draw, no one wins'
  end
  return @player1_log, @player2_log
  end
end

class RPSGameRules
  attr_accessor :player1wins, :player2wins
  def initialize
  @player1wins = 0
  @player2wins = 0
  end
  
  def rps_Rules(player1, player2, name1, name2)
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
  puts ""
  end
  return @player1wins, @player2wins
  end
end

class Driver
  attr_accessor :newgame, :player1wins, :player2wins
  def initialize
    @player1wins = 0
    @player2wins = 0
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
  
@newgame = Game.new
  puts "Player 1 name: Computer "
  player1_create = "Computer"
  
  puts "Player 2 name: "
  player2_create = gets.chomp
  
  puts
  
  counter = 1
  
  p1 = @player1wins.to_i
  p2 = @player2wins.to_i

  until counter > numberofrounds
    puts "Round #{counter}... "
    puts
    
    counter += 1
    
    puts "Player 1 name: #{player1_create}"

    puts "#{player1_create}: rock, paper, or scissors? "
    player1_move_create = ["rock", "paper", "scissors"].sample
    puts "#{player1_move_create}"


    until player1_move_create == "rock" || player1_move_create == "paper" || player1_move_create  == "scissors"
      puts "Please enter rock, paper, or scissors"
      player1_move_create = gets.chomp.downcase
    end

    puts "Player 2 name: #{player2_create}"

    puts "#{player2_create}: rock, paper, or scissors? "
    player2_move_create = gets.chomp.downcase

    until player2_move_create == "rock" || player2_move_create == "paper" || player2_move_create  == "scissors"
      puts "Please enter rock, paper, or scissors"
      player2_move_create = gets.chomp.downcase
    end
    
    @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    
    didsomeonewin = @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    puts didsomeonewin
    
    if didsomeonewin == 1
      p1 += 1
    elsif didsomeonewin == 2
      p2 += 1
    else
    end
    
    puts "Player 1 wins: #{p1} ::: Player 2 wins: #{p2}"
    
    if p1 == p2 && counter > numberofrounds
      puts ""
      puts ":::::TIEBREAKER:::::" * 2
      puts
      puts "Round #{counter}... "
      puts
    
      counter += 1
    
      puts "Player 1 name: #{player1_create}"

      puts "#{player1_create}: rock, paper, or scissors? "
      player1_move_create = ["rock", "paper", "scissors"].sample
      puts "///hidden///"


      until player1_move_create == "rock" || player1_move_create == "paper" || player1_move_create  == "scissors"
        puts "Please enter rock, paper, or scissors"
        player1_move_create = gets.chomp.downcase
      end

      puts "Player 2 name: #{player2_create}"

      puts "#{player2_create}: rock, paper, or scissors? "
      player2_move_create = gets.chomp.downcase

      until player2_move_create == "rock" || player2_move_create == "paper" || player2_move_create  == "scissors"
        puts "Please enter rock, paper, or scissors"
        player2_move_create = gets.chomp.downcase
      end
    
      @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    
      didsomeonewin = @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    
      if didsomeonewin == 1
        p1 += 1
      elsif didsomeonewin == 2
        p2 += 1
      else
      end
      
      puts "Player 1 wins: #{p1} ::: Player 2 wins: #{p2}"
    end
      
    puts
    @player1wins = p1 
    @player2wins = p2
  end
  
  winner1 = @player1wins 
  winner2 = @player2wins
  
  if winner1 > winner2
    puts "#{player1_create.upcase} WON THE GAME"
  elsif winner1 < winner2
    puts "#{player2_create.upcase} WON THE GAME"
  else
    puts "Must have been a tie"
  
  end
  
  puts
  puts "-" * 60
  puts "   " + " GameOver" * 6
  puts "-" * 60
  puts 
  puts
  
end


binding.pry
