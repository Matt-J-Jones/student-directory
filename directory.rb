require 'csv'
@student_list = []

def print_header
  # Print header and line at the top of the list.
  puts "The Students of Villians Academy"
  puts "--------------------------------"
end

def print_student_list
  if @student_list != []
    # prints each name and cohort in student list array to new line.

    @student_list.each_with_index { |item, index|
    output = "#{index+1}: #{item[:name]} (#{item[:cohort]} cohort)".to_s
    puts output
    }
    
  else
    puts "List is empty!".center(32)
  end

  
end

def print_footer
  # Prints footer text with array length.
  puts("--------------------------------")
  if @student_list.length !=0
    output = "Overall, we have #{@student_list.length} great students\n"
    print output
  end
end

def capitalise_letters(name)
  # Capitalises the first letter of the students surnames, in case of names with
  # 'Mc' or 'Mac' it also capitalises the third and fourth letter, respectively.
  # Also removes capitalisation for words like the and of, except for the leading word
  
  temp_arr = name.split(" ")
  return_arr = []
  ignore_words = ["of", "the", "in", "from","in"]
  temp_arr.each_with_index do |word, index|

    word = word.capitalize
    
    if word[1] != nil
      if word[0].downcase + word[1].downcase == "mc" && word[2] != nil
        word[2] = word[2].upcase
      end
    end
    
    if word[2] != nil
      if word[0].downcase + word[1].downcase + word[2].downcase == "mac" && word[3] != nil
        word[3] = word[3].upcase
      end 
    end
    
    ignore_words.each { |ignore|
      if word.downcase == ignore && index != 0
        word = word.downcase
      end
    }    
    
    return_arr << word
  end
  
  return return_arr.join(" ")
end

def check_month
  # check to see if the user has entered the month correctly,
  # loops until it receives accepted input, returns full month name.
  months = ["january", "february", "march", "april", 
            "may", "june", "july", "august", "september", 
            "october", "november", "december"]
   while true
     print "Please enter the cohort month: "
     mon = STDIN.gets.chomp.downcase
     months.each { |month|
       if month.include?(mon)
         return month
       end
     }
   end
end

def input_students
  # takes input from user and assigns cohort months, and creates list of students
  puts "Please enter the names of the students"
  puts "Press enter twice to finish"
  name = STDIN.gets.chomp
  # whilst input is not empty, loops to keep adding students to array
  while !name.empty? do
    # runs check month, assigns month to value.
    month = check_month
    student_name = capitalise_letters(name)
    puts("")
    push_to_students_list(student_name, month)
    student_count
    puts "Press enter twice to finish"
    print "Name: "
    name = STDIN.gets.chomp
  end
end

def student_count
  # counts the number of students on in the directory as they're being added
  if @student_list.length > 1
    puts "Now we have #{@student_list.length} students"
  else 
    puts "Now we have #{@student_list.length} student"
  end
end

def print_students
  # runs print_header and prints header text
  print_header
  # runs print list method to print each item in the array that's input
  print_student_list
  # runs print footer and prints footer text
  print_footer
end

def push_to_students_list(student_name, month)
  @student_list << {name: student_name, cohort: month.to_sym}
end

def print_menu
  # prints the menu options for the interactive menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the student list to students.csv"
  puts "4. Load the student list from students.csv"
  puts "9. Exit"
end

def option_select
  selection = STDIN.gets.chomp
  case selection 
    when "1"
      # runs input_students to generate a list of srudents from the user
      input_students
    when "2"
      print_students
    when "3"
      save_students_list
    when "4"
      load_students_list
    when "9"
      exit
    else
      puts "I don't know what you meant, please input again"
  end
end

def interactive_menu
  loop do
  # print the menu and ask what to do
  print_menu
  # read the input and save to variable, executes the user input
  option_select
  end
end

def save_students_list
  # opens file to save student list as csv
  CSV.open("students.csv", "wb") do |csv|
    #iterate over student list and add to file
    @student_list.each { |student|
      # save to file
      csv << [student[:name], student[:cohort]]
    }
  end
  puts("Save Sucessful! #{@student_list.length} records saved!")
end

def load_students_list(filename = "students.csv")
  # reads each line of csv file, pushes to @student_list.
  CSV.foreach(filename) { |line| push_to_students_list(line[0], line[1]) }
  puts "Loaded #{@student_list.length} records from #{filename}..."
end

def try_load_students
  # load first argument from command line
  filename = ARGV.first 
  # leave method if filename is not given
  return if filename.nil? 
  if File.exist?(filename) #if the file exists
    load_students_list(filename)
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
  
  # Use "ruby directory.rb students.csv" to load on startup.
end

try_load_students

interactive_menu