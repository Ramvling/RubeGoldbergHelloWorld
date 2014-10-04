require "rubygems"
require "google_drive"

image = File.new("hello.png", "r")
bytes = Array.new
if image
	#retreives each byte from the image files
   image.each_byte {|ch| putc ch; bytes.push(ch)}
else
   puts "Unable to open file!"
end
image.close

#looking up phone number on the phonebook google doc
	session = GoogleDrive.login("RubeGoldbergHackathon@gmail.com", "HelloWorld")
	file = session.file_by_title("phonebook")
	file.download_to_file("phonebook.txt")
	phoneBook = IO.readlines("phonebook.txt")
	phoneBook = phoneBook[0]
	names = Array.new
	phoneBook.each_line("<span>") {|chunk| names.push(chunk)}
	names.delete_at(0)
#asks the user who in the phonebook they want to contact
	p "Who do you contact?"
	contact = gets
	contact = contact.delete("\n")

#searches for a match
match = false
number = "4695442662"
for n in names
	if (contact == n[0..(contact.length-1)])
		match = true
		tokenize = n.split()
		number = tokenize[1]
		number = number[0..9]
	end
end

if (!match)
	p "Match not found, contacting default"
else
	p "Match found, preparing to contact " + contact
end

#generate new .png file to store contact number
output = ""
i = 0
j = 40
k = 0
png = File.new("number.png", "w")
	for byte in bytes
		if i == j
			output = output + number[k]
			k = k + 1
			j = j + 40
		else 
			output = output + number[k]
		end
		if k > 9
			k = 9
		end
		i = i + 1
	end
	png.puts output
	png.close