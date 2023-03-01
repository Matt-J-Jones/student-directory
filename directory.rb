# Assign students to array
student_list = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Rached", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Jofferey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  # Print header and line at the top of the list.
puts "The Students of Villians Academy\n----------------------------"
end

def print_list(items)
  # prints each name and cohort in student list array to new line.
  items.each { |item|
  puts("#{item[:name]} (#{item[:cohort]} cohort)")
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
