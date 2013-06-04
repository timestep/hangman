#set the list of random words
words = ["lemonade", "apple", "phone", "soda"]

#set answer array 
word = words[rand(4)]
answer = word.split("")

#set guessed array
guess = []
word.length.times do
	guess = guess + ["_"]
end
puts guess.join(" ")

#set array for used letters
$used = []
def send_to_used(used_letter)
	if $used.index(used_letter)
		puts "You already used that letter."
	else
		$used << used_letter
		$used = $used.sort
	end
end

#interactive part
win = 8
i =0
while true 
	puts
	puts

	letter_guess = gets.chomp
	send_to_used(letter_guess)

	check = false

	0.upto(word.length-1) do |x|
		if answer[x] == letter_guess
			guess[x] = letter_guess
			check = true
		end
	end

	if !check
		i += 1
	end

	puts guess.join(" ")

	if guess == answer
		puts "You won!"
		break
	end

	puts "These are your used letters: #{$used.join(", ")}"

	puts "You have #{win-i} guesses left."

	if i == win
		puts "You lost! Sorry but you suck."
		break
	end

	puts
	puts

end
