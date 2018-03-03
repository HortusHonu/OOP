class Image
	# Loads original image arrays into instance variable
	def initialize(image)
		@image = image
	end

	# Takes pixel locations, checks if within desired blur distance, applies to image
	def blur(blur_distance)
		pixels = get_pixels
		@image.each_with_index do |row, row_index|
			row.each_with_index do |pixel, col_index|
				pixels.each do |found_row_index, found_col_index|
					# Use Manhattan Distance method to verify found and new pixels are within desired 
					# blur distance and set row/col index pair to 1 (on)
					if manHatDist(row_index, col_index, found_row_index, found_col_index) <= blur_distance
						@image[row_index][col_index] = 1
					end
				end
			end
		end							
	end

	# Finds the location of pixels that are "on"
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

	# Finds distance from found pixels to desired "new" pixels
	def manHatDist (x1, y1, x2, y2)
		row_distance = (x2 - x1).abs
		col_distance = (y2 - y1).abs
		row_distance + col_distance
	end

	# Iterates thru the image arrays and outputs new inamge with pixels on
	def output_image
		@image.each do |pixels_on|
			puts pixels_on.join
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

# Creates now instance of image from Image Class, calls blur method with (desired distance)
image.blur(3)
# Outputs the new "blurred" image
image.output_image

