require_relative 'sides.rb'

class Polygon
  attr_reader :sides

  def initialize(args={})
    initialize_sides(args[:sides])

    raise 'Polygon is not valid (or a check of whether it is valid has not been made)' unless valid?
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
end

class Triangle < Polygon
  def valid?
     @sides.length == 3
  end
end
