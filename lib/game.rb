require_relative 'player'
require_relative 'game'
require_relative 'game_turn'


module MasterMind
class Game
	attr_reader :game_codes, :white_balls, :turn_count, :game_code, :repository

	def initialize
		@game_code = []
		@game_codes = []
		@white_balls = 0
		@turn_count = 0
	end

	def add_game_codes(a_code)
		@game_codes << a_code
	end

	def code_for_game(game_codes)
		@game_code << game_codes.sample(1)
	end

	def load_ball_orders(from_file)
		File.readlines(from_file).each do |line|
			add_game_codes(GameCodes.from_csv(line))
		end

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
		puts "Turn #{@turn_count + 1}"
		while turn_count < turns
			GameTurn.take_turn(player)
			print_guess_accuracy(player.guess)
			@turn_count += 1
		end
	end

	def print_guess_accuracy(guess)
		if game_code.include?(guess)
			@white_balls += 1
		end
		puts "You have #{@white_balls} white balls"
	end

end
end

