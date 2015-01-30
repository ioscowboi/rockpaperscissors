require 'minitest/autorun'
require_relative 'game'

# PlayerTest will check to make sure that the players method (PlayersScoreboard>players) is accurately tracking who won which game. 

class Player_Test < Minitest::Test
  def test_players_class
    return_value = PlayersScoreboard.new
    assert_equal 1, return_value.players(1, "Aaron")
  end
end