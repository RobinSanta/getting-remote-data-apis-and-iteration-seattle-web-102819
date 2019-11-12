def welcome
  # puts out a welcome message here!
  puts "Welcome the Star Wars fan database!"
end

def get_character_from_user
  puts "Please enter a character name."
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
  # gets takes in user input
  #the .chomp ends the input. This prevents errors casues by new lines appearing.

  # 1. tmp = gets
  # hello
  # =>"hello\n"

  # 2. tmp = gets.chomp
  # hello
  # =>"hello"
end
