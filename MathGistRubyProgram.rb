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

#************** Solution Starts Here ***************

#Order O( (n/2)^2 ) solution. Can be improved, but this will reduce readability. 
#Will branch off a version with index counting instead of a iterative loop later.

#Don't know how to write this into a gem yet. Will learn and implement if desired.

#!/usr/bin/env ruby



#inputString is the expression to be evaluated, and the second string shows work
# if you put in "Show Work" as it's value
def stringEvaluator(inputString="Default Input", showWork="false")
	#First we tokenize the string using split. We have been given that input will
	#be valid, so we don't have to worry about strange inputs
	tokArray = inputString.split(' ')

	#This code chunk deals with the edge case of a single number being fed in.
	#I used a regular expression to catch versions of 0 since an invalid to_f returns 0.
	if(tokArray.length ==1)
		if( (tokArray[0] == "0") || (/\A[0]+.[0]+\Z/ =~ tokArray[0]) )
			return 0.0
		elsif (tokArray[0].to_f != 0.0)
			return tokArray[0].to_f
		else
			return "Invalid Expression"	
		end
	end

   	#Now we walk through the token array by odd numbers so that we only hit the operators
   	#We can do this because input is stipulated as valid, and thuse will be multiples of 3
   	#tokens, number, operator, number. As stipulated, multiplication and division are 
   	#given equal weight, and will be evaluated first left to right.

   	#When we hit the operator we are looking for, it is evaluated and it's three tokens are
   	# replaced in the array by a single floating point value. Then the loop is reset and it
   	# looks through again, until all multiplication and division hes been evaluated.

   	# if we want to see the evaluation step by step, we can pass in true as 
   	# a second paramater
   	if(showWork == "Show Work")
   		print tokArray
   		puts " "
   	end

	i = 1
	while i < tokArray.length
		if ((tokArray[i] == "*") || (tokArray[i] == "/"))
			if (tokArray[i] == "*")
				evaluation = tokArray[i-1].to_f * tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				if(showWork == "Show Work")
   					print tokArray
   					puts " "
   				end
			else
				evaluation = tokArray[i-1].to_f / tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				if(showWork == "Show Work")
   					print tokArray
   					puts " "
   				end
			end
		elsif ((tokArray[i] == "+") || (tokArray[i] == "-"))
			#this just checks for valid tokens
		else
			return "Invalid Expression"
		end			
		#operatorArray.push tokArray[i]

		i = i + 2
	end

	#Now it walks through evaluatiing plus and minus occurences left to right, 
	#because all multiplaication and division has already been evaluated left to right
	#When it finishes there will be a signel floating point number in the array, 
	#which is the evaluated expression's value. This is then returned 

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
				if(showWork == "Show Work")
   					print tokArray
   					puts " "
   				end
			else
				evaluation = tokArray[i-1].to_f - tokArray[i+1].to_f
				tokArray.delete_at(i)
				tokArray.insert(i, evaluation)
				tokArray.delete_at(i+1)
				tokArray.delete_at(i-1)
				i = -1
				if(showWork == "Show Work")
   					print tokArray
   					puts " "
   				end
			end
		elsif ((tokArray[i] == "+") || (tokArray[i] == "-"))
			#This just checks for valid tokes
		else
			return "Invalid Expression"
		end			

		i = i + 2 # this skips us to next operator
	end
	
	return tokArray[0]

end

#Wierdness, if I capitalize stringEvaluator it works with arguments, but not without

#**************TESTBED FOLLOWS*******************

ARGV.each do|a|
  puts "Argument: #{a}"
end
puts " "

puts "Input argument from running ruby file:"
puts ARGV[0]
puts stringEvaluator ARGV[0]

puts " "
puts "Evaluate: 000.00"
puts stringEvaluator "000.00"

puts " "
puts "Evaluate: 0"
puts stringEvaluator "0"

puts " "
puts "Evaluate: 0 / 7"
puts stringEvaluator "0 / 7"

puts " "
puts "Evaluate: 7 / 0"
puts stringEvaluator "7 / 0"

puts " "
puts "Evaluate: 0A0.00"
puts stringEvaluator "0A0.00"

puts " "
puts "Evaluate: 12 3 + 7"
puts stringEvaluator "12 3 + 7"

puts " "
puts "Evaluate: 12 * 3 + 7 / 4 + 36 - 12 * -6, Show Work"
puts stringEvaluator "12 * 3 + 7 / 4 + 36 - 12 * -6", "Show Work"

puts " "
puts "Evaluate: 3.2 + 7"
puts stringEvaluator "3.2 + 7" 

puts " "
puts "Evaluate: 3 * 7.7"
puts stringEvaluator "3 * 7.7"

puts " "
puts "Evaluate: 3 - 7"
puts stringEvaluator "3 - 7"

puts " "
puts "Evaluate: 3.6 / 7.2"
puts stringEvaluator "3 / 7"