require 'pry'

require_relative 'players'
require_relative 'rpsgamerules'



# Driver class performs all the user interaction with the players. It creates player's names, prompts for moves, and determines the winner of each round/game.
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
  
  puts 
  puts "Ok, #{numberofrounds} rounds. Let's begin.."
  puts
  require_relative 'game'
  @newgame = Game.new

  player1_create = "Computer"
  puts "Player 1 name: #{player1_create} "
  
  puts "Player 2 name: "
  player2_create = gets.chomp
  
  puts

# counter is the local variable that counts the number of rounds played until it matches the number of games declared by the user
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
    puts "//////////////hidden//////////////"


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
    
    didsomeonewin = @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    
    if didsomeonewin == 1
      p1 += 1
    elsif didsomeonewin == 2
      p2 += 1
    else
    end
    
    puts "Player 1 wins: #{p1} ::: Player 2 wins: #{p2}"
    
    if p1 == p2 && counter > numberofrounds
      until p1 != p2 && counter > numberofrounds
        puts ""
        puts ":::::TIEBREAKER:::::" * 2
        puts
        puts "Round #{counter}... "
        puts
    
        counter += 1
    
        puts "Player 1 name: #{player1_create}"

        puts "#{player1_create}: rock, paper, or scissors? "
        player1_move_create = ["rock", "paper", "scissors"].sample
        puts "//////////////hidden//////////////"


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
    
        #didsomeonewin tracks the return value from the round method in the Game class. Depending on its value (0, 1, or 2),
        #p1 or p2 gets the value. 
        didsomeonewin = @newgame.round(player1_create, player1_move_create, player2_create, player2_move_create, numberofrounds)
    
        if didsomeonewin == 1
          p1 += 1
        elsif didsomeonewin == 2
          p2 += 1
        else
        end
      
        puts "Player 1 wins: #{p1} ::: Player 2 wins: #{p2}"
      end
    end
      
    puts
    @player1wins = p1 
    @player2wins = p2
  end
  
  winner1 = @player1wins 
  winner2 = @player2wins
  
  if winner1 > winner2
    puts "#{player1_create.upcase} WON THE GAME"
    # scoreboard = PlayersScoreboard.new
    # scoreboardTracker = scoreboard.players(@thewinner, @winnersName, @losersName)
  elsif winner1 < winner2
    puts "#{player2_create.upcase} WON THE GAME"
    # scoreboard = PlayersScoreboard.new
    # scoreboardTracker = scoreboard.players(@thewinner, @winnersName, @losersName)
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
