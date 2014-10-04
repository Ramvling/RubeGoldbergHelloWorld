#system("ruby parseImage.rb")

image = File.new("number.png", "r")
if image
	#retreives the number from the image file
   longNumber = image.gets
   puts longNumber
end
image.close
number = ""
j = 1
#builds number
for i in 0..9
	number = number + longNumber[j]
	j = j + 40
end

cmd = 'curl "http://textbelt.com/text" -d number=' + number + '"message=Hello World"'
#exec(cmd)