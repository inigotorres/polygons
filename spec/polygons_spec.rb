require './polygons'

describe "A polygon" do
  it "can't have negative sides" do
    expect{Polygon.new(sides: [-1])}.to raise_error
  end

  context "when it is a triangle" do
    it "can be created" do
      a_triangle = Triangle.new(sides: [1,2,3])
      expect(a_triangle.to_s).to eq([1,2,3])
    end
    it "can't be created if number of sides is not three" do 
      expect{Triangle.new(sides: [1,2,3,4])}.to raise_error
    end
    it "can't be created if the sum of two sides is shorter than the third" do
      expect{Triangle.new(sides: [1,1,5])}.to raise_error
    end
  end
end
