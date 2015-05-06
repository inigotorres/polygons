require './triangle.rb'

describe "A triangle" do
  context "if it doesn't have exactly three sides" do
    it "can't be created if number of sides is not three" do 
      error_message = "A triangle must have three sides"
      expect{Triangle.new(sides: [1,2,3,4])}.to raise_error(error_message)
    end
  end
  context "if the sum of any two sides is shorter than the third" do
    it "can't be created if the sum of two sides is shorter than the third" do
      error_message = "A triangle can't have one side longer than the sum of the others"
      expect{Triangle.new(sides: [1,1,5])}.to raise_error(error_message)
    end
  end
  
  context "if it is valid" do
    it "can be created" do
      a_triangle = Triangle.new(sides: [1,2,2])
      expect(a_triangle.convert_sides_to_array).to eq([1,2,2])
    end
    it "calculates the correct perimeter" do
      a_triangle = Triangle.new(sides: [3,3,3])
      expect(a_triangle.perimeter).to eq(9)
    end
    it "calculates the correct area" do
      a_triangle = Triangle.new(sides:[3,4,5])
      expect(a_triangle.area).to eq(6)
    end
    
    context "and it has three equal sides" do
      it "knows if it is a regular (equilateral) triangle" do
	a_triangle = Triangle.new(sides: [3,3,3])
	expect(a_triangle.regular?).to be true
	expect(a_triangle.equilateral?).to be true

	another_triangle = Triangle.new(sides: [4,3,3])
	expect(another_triangle.regular?).to be false
	expect(another_triangle.equilateral?).to be false
      end
    end

    context "and it satisfies pythagoras' theorem" do
      it "knows if it is a right-angle triangle" do
	a_triangle = Triangle.new(sides: [3,4,5])
	expect(a_triangle.right_angle?).to be true

	another_triangle = Triangle.new(sides: [2,2,2])
	expect(another_triangle.right_angle?).to be false
      end
    end

    context "and it has exactly two equal sides" do
      it "knows if it is an isosceles triangle" do
	a_triangle = Triangle.new(sides: [3,3,2])
	expect(a_triangle.isosceles?).to be true

	another_triangle = Triangle.new(sides: [1,1,1])
	expect(another_triangle.isosceles?).to be false
      end
    end

    context "and all of its sides have different lengths" do
      it "knows if it is a scalene triangle" do
	a_triangle = Triangle.new(sides: [3,4,5])
	expect(a_triangle.scalene?).to be true

	another_triangle = Triangle.new(sides: [2,2,3])
	expect(another_triangle.scalene?).to be false 
      end
    end
  end
end

