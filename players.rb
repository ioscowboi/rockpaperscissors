# # PlayersScoreboard keeps track of all the wins and losses for a player and stores the values in an array at the end of the method.
# class PlayersScoreboard
#   attr_accessor :player1_wins, :player2_wins, :player1_losses, :player2_losses, :player1_log, :player2_log, :numofGames, :name
#   def initialize
#     @player1_wins = 0
#     @player1_losses = 0
#     @player2_wins = 0
#     @player2_losses = 0
#     @player1_log = []
#     @player2_log = []
#     @name = ""
#     @nameofloser = ""
#   end
#
# # The players method keeps track of the players names and who won
# # players method will only accept three outcomes: player 1 wins, player2 wins or there is a draw. Player 1 and Player 2 logs will only be updated if:
# # either player 1 or player 2 wins the round. Otherwise, no one wins and their logs for the active game remain the same state.
# # elWinner is the input variable number that is called in "game.rb > Game class > round method > scoreboardTracker" variable's attribute called 'theWinner'
# # '@theWinner' in previously mentioned path will have a value of 0, or 1, or 2. 1 = player 1 wins, 2 = player 2 wins. 0 = no one wins.
# # so the basic path is: @theWinner > elWinner > whowon. Consequently, whowon's state will change to either 0, or 1, or 2 to run the tests below.
# # @name receives the winners name depending of the
#   def players(elWinner, winnersname, losersname)
#     winner_name = winnersname
#     loser_name = losersname
#     whowon = elWinner
#
#     @name = ""
#     if whowon == 1
#       @player1_wins += 1
#       @player2_losses += 1
#       @name = winner_name
#       @player1_log = [ @name, @player1_wins, @player1_losses ]
#       @player2_log = [ @nameofloser, @player2_wins, @player2_losses ]
#     elsif whowon == 2
#       @player2_wins += 1
#       @player1_losses += 1
#       @name = winner_name
#       @player2_log = [ @name, @player2_wins, @player2_losses ]
#       @player1_log = [ @nameofloser, @player1_wins, @player1_losses ]
#     else
#       puts 'draw, no one wins!'
#     end
#     return @player1_log, @player2_log
#   end
# end
