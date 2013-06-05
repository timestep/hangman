class Hangman
	WORDS = ["lemonade", "apple", "phone", "soda"]
	WORD = WORDS.sample

	attr_accessor :answer, :display, :used, :guess, :guesses_left

	def initialize
		@answer = WORD.split("")
		@display = ("_"*WORD.length).split("")
		@used =[]
		@guesses_left = 8
	end


	def send_to_used(used_letter)
		if @used.index(used_letter)
			puts "You already used that letter."
		else
			@used << used_letter
			@used = @used.sort
		end
	end

	def guess(string)
		send_to_used(string)
		@guess = false
		0.upto(WORD.length-1) do |x|
			if @answer[x] == string
				@display[x] = string
				@guess = true
			end
		end
		if @guess == false
			@guesses_left -= 1
		end
	end

	def show_display
		puts @display.join(" ")
	end

	def show_guesses_left
		puts "You have #{@guesses_left} guesses left"
	end

	def show_guessed_letters
		puts "These are the letters you have guessed already: [ #{@used.join(", ")} ]"
	end
end

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
