words = ["lemonade", "apple", "phone", "soda"]
word = words[rand(4)]
array = word.split("")

word.include? gets.chomp

guess = ""
word.length.times do
	guess = guess + "_ "
end
puts guess

