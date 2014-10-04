system("ruby parseImage.rb")

words = File.new("randomwords.txt", "r")
words = IO.readlines("randomwords.txt")
words = words.shuffle
world = ""
for w in words
	if w == "waste\n"
		world = "world"
	end
end

image = File.new("number.png", "r")
if image
	#retreives the number from the image file
   longNumber = image.gets
end
image.close
number = ""
j = 1
#builds number
for i in 0..9
	number = number + longNumber[j]
	j = j + 40
end
p number
cmd = 'curl "http://textbelt.com/text" -d number=' + number + ' -d "message=Hello World"'
exec(cmd)