# Assign students to array
# student_list = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Rached", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Jofferey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]



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

def capitalise_letters(name)
  temp_arr = name.split(" ")
  return_arr = []
  temp_arr.each { |word|
    if word[0].downcase + word[1].downcase == "mc"
      word = word.capitalize
      word[2] = word[2].upcase
      return_arr << word
    elsif word[0].downcase + word[1].downcase + word[2].downcase == "mac"
      word = word.capitalize
      word[3] = word[3].upcase
      return_arr << word
    else
      return_arr << word.capitalize
    end
  }
  
  return return_arr.join(" ")
end

def input_students
  students = []
  puts "Please enter the cohort month"
  month = gets.chomp.downcase
  puts "Please enter the names of the students"
  puts "Press enter twice to finish"
  
  name = gets.chomp
  
  #whilst input is not empty, loops to keep adding students to array
  while !name.empty? do
    students << {name: capitalise_letters(name), cohort: month.to_sym}
    puts "Now we have #{students.length} students"
    name = gets.chomp
  end
  
  # returns filled list of students
  return students
end


# runs input_students to generate a list of srudents from the user
student_list = input_students

# runs print_header and prints header text
print_header

# runs print list method to print each item in the array that's input
print_list(student_list)

# runs print footer and prints footer text
print_footer(student_list)
