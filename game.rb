require 'pry'

require_relative 'players'
require_relative 'rpsgamerules'
require_relative 'driver'


# the "until" counter will run the loop for the number of rounds elected by the players
# the until counter will also call the PlayersScoreboard class for each round to add the wins/losses to the two players total score

# test is a local variable that stores the result of who wins the given round using the Driver instance's method called rps_Driver

# the scoreboard local variable calls the PlayersScoreboard class and store a new object instance of it
# then, scoreboardTracker calls the "players" method of PlayersScoreboard taking two arguments: the winner result (1 or 2) of the test array position 0, and the winners name

# the until counter also determines who will win by running a series of tests; when the test array (defined below) = 1, player 1 wins, when it = 2, player 2 wins.
   






# class Game initializes the array for players, players moves, and the successful winner
class Game
  attr_accessor :players, :player1_move, :player2_move, :winner, :player1_wins, :player2_wins, :player1_losses, :player2_losses, :player1_log, :player2_log, :losersName, :numofGames
  def initialize
    @player1 = []
    @player2 = []
    @player1_move = ""
    @player2_move = ""
    @winner = 0
    @losersName = ""
  end
  
  # the round method recieves the players names and moves from the @newgame.round attribute located in the Driver class. 
  # These data are ultimately fed into the "whowins" local variable to test who won the round via the RPSGameRules class.
  
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
    
    # who wins simply initializes the RPSGameRules (RPS = rock paper scissors), and returns the player 1 and player 2 wins and losses as an array
    whowins = RPSGameRules.new
    
    # test takes four arguments: player 1 move, player 1 name, player 2 move, player 2 name to determine the result of each round (this could be simplified)
    test = whowins.rps_Rules(@player1_move, @player2_move, name1, name2) 
    if test[0] == 1
      @winner = 1
      @winnersName = name1
      @losersName = name2
    elsif test[1] == 1
      @winner = 2
      @winnersName = name2
      @losersName = name1
    else
      @winner = 0
      @winnersName = nowinner
    end
    @thewinner = @winner
    return @thewinner
  end
  
end


