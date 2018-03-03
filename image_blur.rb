class Image
	# Sets instance of image
	def initialize(image)
		@image = image
	end

	def blur(blur_distance)
		pixels = get_pixels
		@image.each_with_index do |row, row_index|
			row.each_with_index do |pixel, col_index|
				pixels.each do |found_row_index, found_col_index|
					if manHatDist(row_index, col_index, found_row_index, found_col_index) <= blur_distance
						@image[row_index][col_index] = 1
					end
				end
			end
		end							
	end

	# Build a new image that returns the blurred image
	def get_pixels
		pixels_on = []
		@image.each.with_index do |row, row_index|
			row.each.with_index do |pixel, col_index|
				if pixel == 1
					pixels_on.push [row_index, col_index]
				end
			end
		end
		pixels_on	
	end

	def manHatDist (x1, y1, x2, y2)
		row_distance = (x2 - x1).abs
		col_distance = (y2 - y1).abs
		row_distance + col_distance
	end

	# Iterates thru the arrays and outputs image
	def output_image
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
[0, 0, 0, 0, 1, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0]
])

image.blur(3)
image.output_image

