require_relative 'sides.rb'

class Polygon
  attr_reader :sides

  def initialize(args={})
    initialize_sides(args[:sides])

     valid?
  end

  def initialize_sides list_of_sides 
    @sides = []
    list_of_sides.each do |side|
      @sides << Side.new(side)
    end
  end

  def to_s
    list_of_sides = []
    @sides.each do |side|
      list_of_sides << side.to_s
    end
    list_of_sides
  end

  def valid?
    raise "Must check whether Polygon is valid in subclass"
  end

  def number_of_sides
    @sides.length
  end
end

class Triangle < Polygon
  def valid?
    raise "Triangle must have three sides" if number_of_sides != 3
  end
end
