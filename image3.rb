class Image3 
  attr_accessor :image, :distance

  def initialize(image)
     @i = image
  end


  def blur_image
    ones =[]
    @i.each_with_index do |row, row_index|
      row.each_with_index do |one, column_index|
        if one == 1
          ones <<[row_index, column_index]
        end
      end
    end
    ones
  end

  def blur(distance)
    ones = blur_image

    @i.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        ones.each do |found_row_index, found_column_index|
          if manhattan_distance(column_index, row_index, found_column_index, found_row_index) <= distance
            @i[row_index][column_index] = 1
          end
        end
      end
    end
  end

  def manhattan_distance( x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @i.each do |data|
      puts data.join(" ")
    end
  end
end

image = Image3.new([
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
      ])

image.blur(1)
image.output_image