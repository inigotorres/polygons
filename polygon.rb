require_relative 'side.rb'

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
