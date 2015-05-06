require_relative 'polygon.rb'

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
