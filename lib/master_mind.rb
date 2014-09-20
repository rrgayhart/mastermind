require_relative 'player'
require_relative 'game'


new_game = MasterMind::Game.new
new_game.add_game_codes("blah.csv")

loop do
	puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
	answer = gets.chomp.downcase
	case answer
	when 'p'
		player=MasterMind::Player.new
		new_game.play_game(player)
	when 'i'
		puts "Guess the order of 4 different colored balls"
	when 'q'
		break
	else
		puts "Cut the shit.  Enter a valid input"
	end
end