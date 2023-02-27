# Assign students to array
student_list = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Rached",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Jofferey Baratheon",
  "Norman Bates",
]

# Print header and line at the top of the list.
puts "The Students of Villians Academy\n----------------------------"

# prints each name in student list array to new line.
student_list.each { |student|
  puts(student)
}

# Prints student count to new line.
print "Overall, we have #{student_list.length} great students\n"