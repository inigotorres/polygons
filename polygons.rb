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
  attr_reader :longest_side, :medium_side, :shortest_side

  def valid?
    raise "A triangle must have three sides" if number_of_sides != 3
    raise "A triangle can't have one side longer than the sum of the others" if !acceptable_sides?    
  end

  def post_initialize
    sides_in_order = @sides.sort {|side| side.length}
    @shortest_side = sides_in_order.last.length
    @medium_side = sides_in_order[1].length
    @longest_side = sides_in_order.first.length

    @a = @longest_side
    @b = @medium_side
    @c = @shortest_side
  end

  def area
    area = (@a+@b-@c) * (@a-@b+@c) * (-@a+@b+@c) * (@a+@b+@c)
    area = Math.sqrt(area)
    area = area / 4
  end

  def equilateral?
    regular?
  end

  def right_angle?
    @longest_side**2 == @medium_side**2 + @shortest_side**2
  end

  def isosceles?
    return false if equilateral?

    (@a == @b) || (@a == @c) || (@b == @c)
  end

  private
  def acceptable_sides?
    @longest_side < @medium_side + @shortest_side    
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

class Rectangle < Polygon
  attr_reader :base_length, :height_length

  def valid?
    raise "A rectangle must have four sides" if number_of_sides != 4
    raise "A rectangle can't be regular" if regular?
    raise "A rectangle must have equal opposite sides" if !acceptable_sides?
  end

  def post_initialize
    sides_in_order = @sides.sort{|side| side.length}
    @base_length = sides_in_order.first.length
    @height_length = sides_in_order.last.length
  end

  def area
    @base_length * @height_length
  end

  private
  def acceptable_sides?
    base_counter = 0
    height_counter = 0

    @sides.each do |side|
      base_counter += 1 if side.length == @base_length
      height_counter += 1 if side.length == @height_length
    end

    (base_counter == 2) && (height_counter == 2)
  end
end
