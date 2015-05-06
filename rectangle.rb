require_relative 'polygon.rb'

class Rectangle < Polygon
  attr_reader :base_length, :height_length

  def valid?
    raise "A rectangle must have four sides" if number_of_sides != 4
    raise "A rectangle can't be regular" if regular?
    raise "A rectangle must have equal opposite sides" if !opposites_are_equal?  
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
  def opposites_are_equal?
    base_counter = 0
    height_counter = 0

    @sides.each do |side|
      base_counter += 1 if side.length == @base_length
      height_counter += 1 if side.length == @height_length
    end

    (base_counter == 2) && (height_counter == 2)
  end
end
