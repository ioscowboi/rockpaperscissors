require 'pry'

class Player
  attr_accessor :name, :score, :move
  def initialize(name,score=0)
    @name = name
    @score = score
    @move = ['rock','paper','scissors'].sample
  end
end

def game(p1,p2)
  player1 = Player.new(p1)
  player2 = Player.new(p2)

  puts "Rock, paper, scissors, shoot!"
  puts "#{p1} throws: "
  puts player1.move
  puts "#{p2} throws: "
  puts player2.move

  game = { 'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper' }
  if game[player1.move] == player2.move
    puts "#{p1} wins!"
    player1.score += 1
  elsif player1.move == player2.move
    puts "Tie!"
  else
    puts "#{p2} wins!"
    player2.score += 1
  end
  
  puts "#{p1}'s score: #{player1.score}"
  puts "#{p2}'s score: #{player2.score}"
end

binding.pry