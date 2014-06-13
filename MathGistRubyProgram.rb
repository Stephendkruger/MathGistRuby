# MathGistRubyProgram.rb

#Write a function that interprets and evaluates strings 
#in the form of basic arithmetic expressions. 
#You should obey the basic order of operations, that is, 
#multiplication and division come before 
#addition and subtraction, and execute operations 
#from left to right. 
#Return results as a floating point number.

#You can expect all the inputs to be valid and 
#limited to the following character set: 
#(tokens separated by spaces):

# 0-9 + - * /

#For example, a simple input would be: "1 + 1" 
#Returns: 2

#A complex example: "10 + 2 * 3 / 4" 
#Returns: 11.5

#Write your solution in Ruby, JavaScript, or CoffeeScript, without the use of eval
# or similar techniques.

#Please optimize for code readability and clarity. 
#What would your solution look like if it was submitted to 
#part of an open-source library?
#Include some test cases that hit all the edge cases 
#of the valid input space


#!/usr/bin/env ruby

ARGV.each do|a|
  puts "Argument: #{a}"
end

def stringEvaluator(a1="Default")
   puts "The method paramater was #{a1}"
   puts "Trying to pull one letter by index 2: #{a1[2]}"
   tokenizedStringArray = a1.split(' ')
   puts tokenizedStringArray
   TokenizedStringArrayEvaluator tokenizedStringArray


end

def TokenizedStringArrayEvaluator(tokArray = "Default Array".split(' '))
	operatorMultDivArray = Array.new
	operatorPlusMinusArray = Array.new

	i = 1
	cap = tokArray.length
	while i < cap
		if ((tokArray[i] == "*") || (tokArray[i] == "/"))
			puts tokArray[i]
		else
			puts "OTHER"
		end			
		#operatorArray.push tokArray[i]

		i = i + 2
	end

	i = 1
	while i < cap
		if ((tokArray[i] == "+") || (tokArray[i] == "-"))
			puts tokArray[i]
		else
			puts "OTHER"
		end			
		#operatorArray.push tokArray[i]

		i = i + 2
	end
	puts "multiplication indexes:"
	puts operatorMultDivArray
	puts "addition indexes:"
	puts operatorPlusMinusArray

end
#Wierdness, if I capitalize stringEvaluator it works with arguments, but not without
stringEvaluator ARGV[0]
stringEvaluator