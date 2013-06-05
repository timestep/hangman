require './hangman_from_class.rb'

class PlayHangman

	def initialize
		@game = Hangman.new
		puts "\n\nH A N G    M A N\n\n"
		@game.show_display
		while true
			if @game.guesses_left == 0
				puts "You lost!"
				break
			elsif @game.answer == @game.display 
				puts "You won!"
				break
			else
				puts "Make a guess:"
				@game.guess(gets.chomp.downcase)
				puts "\n\n"
				@game.show_display
				@game.show_guesses_left
				@game.show_guessed_letters
			end
		end
	end
end


PlayHangman.new
