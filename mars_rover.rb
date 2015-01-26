class Rover
	def initialize(xpos, ypos, direction, plateau)
		@x = xpos
		@y = ypos
		@direction = direction
		@plateau = plateau 
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
			if @y < @plateau.y_size
				@y += 1
				puts "Moving north!"
			else
				puts "Northern end of plateau reached!"
			end
		when "E"
			if @x < @plateau.x_size
				@x += 1
				puts "Moving east!"
			else
				puts "Eastern end of plateau reached!"
			end
		when "S"
			if @y > 0
				@y -= 1
				puts "Moving south!"
			else
				puts "Southern end of plateau reached!"
			end
		when "W"
			if @x > 0
				@x -= 1
				puts "Moving west!"
			else
				puts "Western end of plateau reached!"
			end
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

class Plateau
	attr_accessor :x_size, :y_size

	def initialize(x_size, y_size)
		@x_size = x_size
		@y_size = y_size
	end
end

def run
	print "Please enter the size of the plateau: "
	plateau_size = gets.chomp
	return if plateau_size == ""
	plateau = Plateau.new(plateau_size[0].to_i - 1, plateau_size[2].to_i - 1)

	print "Enter the initial position and direction of the first rover: "
	init1 = gets.chomp
	return if init1 == ""
	rover1 = Rover.new(init1[0].to_i,init1[2].to_i,init1[4].upcase, plateau) 
	print "Enter the instructions for the first rover: "
	rover1.read_instructions(gets.chomp.upcase)

	print "Enter the initial position and direction of the second rover: "
	init2 = gets.chomp
	return if init2 == ""
	rover2 = Rover.new(init2[0].to_i,init2[2].to_i,init2[4].upcase, plateau) 
	print "Enter the instructions for the second rover: "
	rover2.read_instructions(gets.chomp.upcase)

	puts rover1
	puts rover2
end

run