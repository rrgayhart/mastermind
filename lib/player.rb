module MasterMind
class Player
	attr_reader :guess

	def initialize
		@guess=[]
	end

	def << (answer)
		@guess << answer
	end


end
end