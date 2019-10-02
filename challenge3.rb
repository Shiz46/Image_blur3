class Image
    attr_accessor :image
  def initialize(image)
    @image = image 
  end


  def output_image
    @image.each do |row|
      #loop the arrays and displays them in rows 
      puts row.join
    end
  end

  def blur!(distance)
    distance.times do
      blur_image!
    end
  end

  private

    def blur_image!
      blur_image = []
      @image.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          blur_image << [i, row_i] if x == 1
        end
      end

      blur_image.each do |change|
        @image[change[0]][change[1] + 1] = 1 if change[1] + 1 <= @image[change[0]].length - 1
        @image[change[0]][change[1] - 1] = 1 if change[1] - 1 >= 0
        @image[change[0] + 1][change[1]] = 1 if change[0] + 1 <= @image.length - 1
        @image[change[0] - 1][change[1]] = 1 if change[0] - 1 >= 0
      end
    end

end

     row1 = [0,0,0,0]
     row2 = [0,1,0,0]
     row3 = [0,0,0,1]
     row4 = [0,0,0,0]
    
   image = Image.new([row1,row2,row3,row4])

image.blur!(1)
image.output_image
