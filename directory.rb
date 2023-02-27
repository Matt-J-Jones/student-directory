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

def print_header
  # Print header and line at the top of the list.
puts "The Students of Villians Academy\n----------------------------"
end

def print_list(items)
  # prints each name in student list array to new line.
  items.each { |item|
  puts(item)
}
end

def print_footer(items)
  # Prints footer text with array length.
  print "Overall, we have #{items.length} great students\n"
end

# runs print_header and prints header text
print_header

# runs print list method to print each item in the array that's input
print_list(student_list)

# runs print footer and prints footer text
print_footer(student_list)
