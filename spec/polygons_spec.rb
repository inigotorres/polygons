require './polygons'

describe "A polygon" do
  it "can't have negative sides" do
    expect{Polygon.new(sides: [-1])}.to raise_error
  end

  context "when it is a triangle" do
    it "can be created" do
      a_triangle = Triangle.new(sides: [1,2,2])
      expect(a_triangle.sides_as_list).to eq([1,2,2])
    end
    it "can't be created if number of sides is not three" do 
      expect{Triangle.new(sides: [1,2,3,4])}.to raise_error
    end
    it "can't be created if the sum of two sides is shorter than the third" do
      expect{Triangle.new(sides: [1,1,5])}.to raise_error
    end
    it "calculates the correct perimeter" do
      a_triangle = Triangle.new(sides: [3,3,3])
      expect(a_triangle.perimeter).to eq(9)
    end
    it "calculates the correct area" do
      a_triangle = Triangle.new(sides:[3,4,5])
      expect(a_triangle.area).to eq(6)
    end
    it "knows it is a regular (equilateral) triangle" do
      a_triangle = Triangle.new(sides: [3,3,3])
      expect(a_triangle.regular?).to be true
      expect(a_triangle.equilateral?).to be true

      another_triangle = Triangle.new(sides: [4,3,3])
      expect(another_triangle.regular?).to be false
      expect(another_triangle.equilateral?).to be false
    end
  end
end
