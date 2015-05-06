require_relative 'polygon.rb'

class Triangle < Polygon
  attr_reader :longest_side, :medium_side, :shortest_side

  def valid?
    raise "A triangle must have three sides" if number_of_sides != 3
    raise "A triangle can't have one side longer than the sum of the others" if !acceptable_sides?    
  end

  def post_initialize
    sides_in_order = @sides.sort {|side| side.length}
    @shortest_side = sides_in_order.last
    @medium_side = sides_in_order[1]
    @longest_side = sides_in_order.first
  end

  def area
    a = @longest_side.length
    b = @medium_side.length
    c = @shortest_side.length

    area = (a+b-c) * (a-b+c) * (-a+b+c) * (a+b+c)
    area = Math.sqrt(area)
    area = area / 4
  end

  def equilateral?
    regular?
  end

  def right_angle?
    @longest_side.length**2 == @medium_side.length**2 + @shortest_side.length**2
  end

  def isosceles?
    exactly_two_sides_are_equal?
  end

  def scalene?
    !at_least_two_sides_are_equal?
  end

  private
  def acceptable_sides?
    @longest_side.length < @medium_side.length + @shortest_side.length    
  end

  def at_least_two_sides_are_equal?
    @longest_side.length == @medium_side.length ||
    @medium_side.length == @shortest_side.length  
  end

  def exactly_two_sides_are_equal?
    at_least_two_sides_are_equal? && !equilateral?
  end
end
