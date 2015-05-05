require_relative 'sides.rb'

class Polygon
  attr_reader :sides

  def initialize(args={})
    initialize_sides(args[:sides])
    post_initialize

    valid?
  end

  def valid?
    raise "Must check whether Polygon is valid in subclass"
  end

  def post_initialize
  end

  def convert_sides_to_array
    array_of_sides = []
    @sides.each do |side|
      array_of_sides << side.to_s
    end
    array_of_sides
  end

  def number_of_sides
    @sides.length
  end

  def perimeter
    sum = 0
    @sides.each do |side|
      sum += side.length 
    end
    sum
  end

  def regular?
    first_side = @sides.first

    @sides.each do |side|
      return false if side.length != first_side.length
    end
    true
  end

  private
  def initialize_sides list_of_sides 
    @sides = []
    list_of_sides.each do |side|
      @sides << Side.new(side)
    end
  end
end

class Triangle < Polygon
  def valid?
    raise "A triangle must have three sides" if number_of_sides != 3
    raise "A triangle can't have one side longer than the sum of the others" if !acceptable_sides?    
  end

  def post_initialize
    @a = @sides[0].length
    @b = @sides[1].length
    @c = @sides[2].length
  end

  def area
    area = (@a+@b-@c) * (@a-@b+@c) * (-@a+@b+@c) * (@a+@b+@c)
    area = Math.sqrt(area)
    area = area / 4
    area
  end

  def equilateral?
    regular?
  end

  private
  def acceptable_sides?
    is_acceptable = true
    is_acceptable = false if @a > (@b+@c)
    is_acceptable = false if @b > (@a+@c)
    is_acceptable = false if @c > (@a+@b)   
    is_acceptable 
  end
end

class Square < Polygon
  def valid?
    raise "A square must have four sides" if number_of_sides != 4
    raise "All the sides of a square must be the same length" if !regular?
  end

  def area
    a_side = @sides.first
    a_side.length * a_side.length
  end
end

