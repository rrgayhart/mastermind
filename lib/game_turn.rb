require_relative 'player'

module MasterMind
module GameTurn

	def self.take_turn(player)
		puts "Enter guess for color of first ball"
		answer1 = gets.chomp.downcase
		player << answer1
		puts "Enter guess for color of second ball"
		answer2 = gets.chomp.downcase
		player << answer2
		puts "Enter guess for color of third ball"
		answer3 = gets.chomp.downcase
		player << answer3
		puts "Enter guess for color of fourth ball"
		answer4 = gets.chomp.downcase
		player << answer4
	end

end
end