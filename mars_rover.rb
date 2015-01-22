class Rover
	def initialize(xpos, ypos, direction)
		@x = xpos
		@y = ypos
		@direction = direction
	end

	def read_instructions(instructions)
		instructions.each_char do |instruction|
			if instruction == "M"
				move
			elsif instruction == "L" || instruction == "R"
				turn(instruction)
			end
		end
	end

	def move
		case @direction
		when "N"
			@y += 1
		when "E"
			@x += 1
		when "S"
			@y -= 1
		when "W"
			@x -= 1
		end
	end

	def turn(rotation)
		if (@direction == "N" && rotation == "L") || (@direction == "S" && rotation == "R")
			@direction = "W"
			# puts "Turning west!"
		elsif (@direction == "E" && rotation == "L") || (@direction == "W" && rotation == "R")
			@direction = "N"
			# puts "Turning north!"
		elsif (@direction == "S" && rotation == "L") || (@direction == "N" && rotation == "R")
			@direction = "E"
			# puts "Turning east!"
		else
			@direction = "S"
			# puts "Turning south!"
		end
	end

	def to_s
		"#{@x} #{@y} #{@direction}"
	end
end

print "Please enter the size of the plateau: "
plateau_size = gets.chomp

print "Enter the initial position and direction of the first rover: "
init1 = gets.chomp
rover1 = Rover.new(init1[0].to_i,init1[2].to_i,init1[4].upcase) 
print "Enter the instructions for the first rover: "
rover1.read_instructions(gets.chomp.upcase)

print "Enter the initial position and direction of the second rover: "
init2 = gets.chomp
rover2 = Rover.new(init2[0].to_i,init2[2].to_i,init2[4].upcase) 
print "Enter the instructions for the second rover: "
rover2.read_instructions(gets.chomp.upcase)

puts rover1
puts rover2