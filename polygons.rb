class Polygon
  attr_reader :sides

  def initialize(args={})
    @sides = args[:sides]

    raise 'Polygon is not valid (or a check of whether it is valid has not been made)' unless valid?
  end

  def valid?
    @sides.each do |side|
      return false if side <= 0
    end
    
    post_valid? 
  end

  def post_valid?
    raise 'post_valid must be implemented inside child class'
  end
end

class Triangle < Polygon
  def post_valid?
     @sides.length == 3
  end
end
