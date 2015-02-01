# RPSGameRules class sets the rules for each round by testing what was entered by the user/computer, with the value that is considered a winner value.
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