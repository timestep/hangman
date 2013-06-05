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
		if ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"].index string 
		
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
		else 
			puts "Please enter a single letter."
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
