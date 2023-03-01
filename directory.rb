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
  temp_arr.each_with_index { |word, index|

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
  }
  
  return return_arr.join(" ")
end

def check_month
  # check to see if the user has entered the month correctly,
  # loops until it receives accepted input, returns full month name.
  months = "January,February,March,April,May,June,July,August,September,October,November,December".downcase.split(",")
   while true
     print "Please enter the cohort month: "
     mon = gets.chomp.downcase
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
  name = gets.chomp
  #students = []
  # whilst input is not empty, loops to keep adding students to array
  while !name.empty? do
    # runs check month, assigns month to value.
    month = check_month.to_sym
    puts("")
    @student_list << {name: capitalise_letters(name), cohort: month}

    if @student_list.length > 1
      puts "Now we have #{@student_list.length} students"
    else 
      puts "Now we have #{@student_list.length} student"
    end
    
    puts "Press enter twice to finish"
    print "Name: "
    name = gets.chomp
  end
  
  # returns filled list of students
  # return students
end

def print_menu
  # prints the menu options for the interactive menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def print_students
  # runs print_header and prints header text
  print_header
  # runs print list method to print each item in the array that's input
  print_student_list
  # runs print footer and prints footer text
  print_footer
end

def option_select
  selection = gets.chomp
  case selection 
    when "1"
      # runs input_students to generate a list of srudents from the user
      input_students
    when "2"
      print_students
    when "9"
      exit
    else
      puts "I don't know what you meant, please input again"
  end
end

def interactive_menu
  # opens menu, takes input from user, and executes.
  loop do
  # 1. print the menu and ask what to do
  print_menu
  # 2. read the input and save to variable
  # 3. execute the users input
  option_select
  # 4. repeat to step 1.
  end
end

interactive_menu