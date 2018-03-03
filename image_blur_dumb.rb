class Image
	# Sets instance of image
	def initialize(image)
		@image = image
	end

#	def blur(distance)

#	end

	def blur(row_index, col_index)
		row_elements = @image[0]

		#	if row_index + col_index <= 
		 # if row_index + col_index <= @distance
		 # 	@image[row_index][col_index] = 1
		 # end

		 while row_index + col_index <= manHatDist
		 	

		 if row_index != 0
		 	@image[row_index-1][col_index] = 1
		 end

		 if col_index != 0
		 	@image[row_index][col_index-1] = 1
		 end
		
		 if col_index != row_elements.length-1
		 	@image[row_index][col_index+1] = 1
		 end

		 if row_index != @image.length-1
		 	@image[row_index+1][col_index] = 1
		 end
#		x2 = row_index + 3
#		y2 = col_index + 3
		#root = ((x2 - row_index)*2) + ((y2 - col_index))*2
		#@distance = Math.sqrt(root)
		#puts @distance.round
		
# Need to populate an array of coordinates with the result of manHat distance

#		Math.sqrt(((x2 - row_index)*2) + ((y2 - col_index))*2)
   end

	# def manhattan(row_index, col_index)
	# 	x2 = row_index + 3
	# 	y2 = col_index + 3
	# 	root = ((x2 - row_index)*2) + ((y2 - col_index))*2
	# 	distance = Math.sqrt(root)
	# 	puts distance
	# end

	# Build a new image that returns the blurred image
	def transform(manHatDist)
		pixel_on = []
		manHatDist.times do
		@image.each.with_index do |row, row_index|
			row.each.with_index do |pixel, col_index|
				if pixel == 1
					pixel_on.push [row_index, col_index]
				end
			end
		end
		pixel_on.each do |touple|
			#blur(*touple)
			row_index, col_index = touple
			blur(row_index, col_index)
		end
	end
	end

	# Iterates thru the arrays and outputs image
	def output
		@image.each do |row|
			row.each do |pixel|
				print pixel
			end
			puts
		end
	end

end

# Original image before blur	
image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0]
])

image.transform(3)
image.output

