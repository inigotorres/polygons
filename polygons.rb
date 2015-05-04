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

  def sides_as_list
    list_of_sides = []
    @sides.each do |side|
      list_of_sides << side.to_s
    end
    list_of_sides
  end

  def number_of_sides
    @sides.length
  end

  def perimeter
    sum = 0
    sides_as_list.each do |side_length|
      sum += side_length 
    end
    sum
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
    raise "Triangle must have three sides" if number_of_sides != 3
    raise "Triangle can't have one side longer than the sum of the others" if !acceptable_sides?    
  end

  def post_initialize
    list_of_sides = sides_as_list
    @a = list_of_sides[0]
    @b = list_of_sides[1]
    @c = list_of_sides[2]
  end

  def area
    area = (@a+@b-@c) * (@a-@b+@c) * (-@a+@b+@c) * (@a+@b+@c)
    area = Math.sqrt(area)
    area = area / 4
    area
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
