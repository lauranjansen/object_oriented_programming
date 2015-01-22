class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}!"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object!"
	end
end

chris = Instructor.new("Chris")
# chris.name = "Chris"
chris.greeting

christina = Student.new("Christina")
# christina.name = "Christina"
christina.greeting

chris.teach
christina.learn

# doesn't work because the Student class doesn't have a method called 'teach'
christina.teach