class Image

  def initialize(imageData)
    @imageValues = imageData
  end

  def output_image
    @imageValues.each do |row|
      puts row.join
    end
  end

  def blur
    # find the ones
    duplicate = Marshal.load(Marshal.dump(@imageValues))
    duplicate.each_with_index do |row, y| 
      row.each_with_index do |pixel, x|
        next if pixel != 1
        @imageValues[y-1][x] = 1 
        @imageValues[y+1][x] = 1 unless y == 4
        @imageValues[y][x-1] = 1 
        @imageValues[y][x+1] = 1 unless x == 3

      end
    end
  end
end

image = Image.new([
[0,0,0,0],
[0,1,0,0],
[0,0,0,1],
[0,0,0,0]
])

image.output_image

image.blur
puts " "
image.output_image()

# 0100
# 1111
# 0111
# 0001