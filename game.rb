require_relative 'player'
require_relative 'game_turn'

module MasterMind
class Game
	attr_accessor :game_code

	def initialize
		@game_code = []
	end

	def load_balls(from_file)
		File.readlines(from_file).each do |line|
			@game_code = line.split(',')
		end
		puts game_code
	end

	def play_game(player)
		loop do
			puts "\nHow many game turns? (Must be an even number)"
			answer = gets.chomp.downcase
			case answer
			when /^\d+$/
				answer = answer.to_i
				if answer.to_i % 2 == 0
					play(answer.to_i, player)
				else 
					puts "uhh no.  Put an even number."
				end
			when 'q'
				break
			else
				puts "I am in no mood for your bullshit.  Give me an EVEN integer or enter 'q'."
			end
		end
	end

	def play(turns, player)
		turn_count = 0
		while turn_count < turns
			puts "Turn #{turn_count + 1}"
			calculate_accuracy(GameTurn.take_turn(player))
			turn_count += 1
		end
	end

	def calculate_accuracy(guess)
		player_array = guess
		count = 0
		correct_guesses = []
		already_selected = []

		while count < 5
			game_code.each do |ball|
				if ball == player_array[count] && !already_selected.include?(ball)
					correct_guesses << ball
					already_selected << ball
				end
			end
			count += 1
		end
		
		white_balls(correct_guesses.count)
		puts correct_guesses.delete_at(correct_guesses.count)
		
	end

	def white_balls(number)
		white_balls=number
		puts white_balls
	end

end
end

