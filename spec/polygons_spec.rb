require './polygons'

describe "A polygon" do
  it "can't have negative sides" do
    expect{Polygon.new(sides: [-1])}.to raise_error
  end

  context "when it is a triangle" do
    it "can be created" do
      a_triangle = Triangle.new(sides: [1,2,2])
      expect(a_triangle.convert_sides_to_array).to eq([1,2,2])
    end
    it "can't be created if number of sides is not three" do 
      error_message = "A triangle must have three sides"
      expect{Triangle.new(sides: [1,2,3,4])}.to raise_error(error_message)
    end
    it "can't be created if the sum of two sides is shorter than the third" do
      error_message = "A triangle can't have one side longer than the sum of the others"
      expect{Triangle.new(sides: [1,1,5])}.to raise_error(error_message)
    end
    it "calculates the correct perimeter" do
      a_triangle = Triangle.new(sides: [3,3,3])
      expect(a_triangle.perimeter).to eq(9)
    end
    it "calculates the correct area" do
      a_triangle = Triangle.new(sides:[3,4,5])
      expect(a_triangle.area).to eq(6)
    end
    it "knows if it is a regular (equilateral) triangle" do
      a_triangle = Triangle.new(sides: [3,3,3])
      expect(a_triangle.regular?).to be true
      expect(a_triangle.equilateral?).to be true

      another_triangle = Triangle.new(sides: [4,3,3])
      expect(another_triangle.regular?).to be false
      expect(another_triangle.equilateral?).to be false
    end
  end

  context "when it is a square" do
    it "can be created" do
      a_square = Square.new(sides: [1,1,1,1])
      expect(a_square.convert_sides_to_array).to eq([1,1,1,1])
    end
    it "can't be created if it doesn't have four sides" do
      error_message = "A square must have four sides"
      expect{Square.new(sides: [1,1,1])}.to raise_error(error_message)
    end
    it "can't be created if it is not regular" do
      error_message = "All the sides of a square must be the same length"
      expect{Square.new(sides: [1,1,1,2])}.to raise_error(error_message)
    end
  end
end
