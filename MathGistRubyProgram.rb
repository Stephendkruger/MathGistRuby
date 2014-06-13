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
   puts " "
   tokenizedStringArray = a1.split(' ')
   puts tokenizedStringArray
   puts " "
   TokenizedStringArrayEvaluator tokenizedStringArray


end

def TokenizedStringArrayEvaluator(tokArray = "Default Array".split(' '))
	operatorMultDivArray = Array.new
	operatorPlusMinusArray = Array.new

	i = 1
	while i < tokArray.length
		if ((tokArray[i] == "*") || (tokArray[i] == "/"))
			#puts tokArray[i]
			if (tokArray[i] == "*")
				evaluation = tokArray[i-1].to_f * tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				puts tokArray
				puts " "
			else
				evaluation = tokArray[i-1].to_f / tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				puts tokArray
				puts " "
			end
		elsif ((tokArray[i] == "+") || (tokArray[i] == "-"))
			#this just checks for valid tokens
		else
			puts "Invalid Expression"
		end			
		#operatorArray.push tokArray[i]

		i = i + 2
	end

	#Now it walks through evaluatiing plus and minus occurences left to right, 
	#because all multiplaication and division has already been evaluated left to right 

	i = 1
	while i < tokArray.length
		if ((tokArray[i] == "+") || (tokArray[i] == "-"))
			#puts tokArray[i]
			if (tokArray[i] == "+")
				evaluation = tokArray[i-1].to_f + tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				puts tokArray
				puts " "
			else
				evaluation = tokArray[i-1].to_f - tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				puts tokArray
				puts " "
			end
		elsif ((tokArray[i] == "+") || (tokArray[i] == "-"))
			#This just checks for valid tokes
		else
			puts "Invalid Expression"
		end			
		#operatorArray.push tokArray[i]

		i = i + 2
	end
	puts " "
	puts tokArray

end
#Wierdness, if I capitalize stringEvaluator it works with arguments, but not without
stringEvaluator ARGV[0]
stringEvaluator