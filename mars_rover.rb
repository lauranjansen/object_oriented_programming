class Rover
	def initialize(xpos, ypos, direction)
		@x = xpos
		@y = ypos
		@direction = direction
	end

	def read_instruction(instructions)
		instructions.each do |instruction|

		end
	end

	def move
		case direction
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
			puts "Turning west!"
		elsif (@direction == "E" && rotation == "L") || (@direction == "W" && rotation == "R")
			@direction = "N"
			puts "Turning north!"
		elsif (@direction == "S" && rotation == "L") || (@direction == "N" && rotation == "R")
			@direction = "E"
			puts "Turning east!"
		else
			@direction = "S"
			puts "Turning south!"
		end
	end
end