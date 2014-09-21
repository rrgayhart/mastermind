# Require minitest
require 'minitest/autorun'

# Require the file you are trying to test
# Note that there is a ../ in front of the file name
# This is because our test file is in a different directory
require_relative '../game.rb'


# Namespacing here might be a little hard to understand
# Since your Game class is inside the module MasterMind...
# we have wrapped the test in this module
# You can think of the module here as a 'Last Name'
module MasterMind

  # Here we are defining the testing class
  # Tests are in Ruby too - so they behave the same
  # the class is GameTest and it inherits from MiniTest
  class GameTest < Minitest::Test

    # Here is your first test!
    def test_it_is_initialized_with_a_game_code
      game = Game.new
      assert_equal [], game.game_code
    end

  end
end
