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

puts
puts "H A N G   M A N"
puts

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
	puts guess.join(" ")
	puts "Make a guess:"

	letter_guess = gets.chomp.downcase
	send_to_used(letter_guess)
	puts
	puts
	puts

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

end
