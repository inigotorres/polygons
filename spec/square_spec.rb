require './square.rb'

describe "A square" do
  context "if it doesn't have exactly four sides" do
    it "can't be created" do
      error_message = "A square must have four sides"
      expect{Square.new(sides: [1,1,1])}.to raise_error(error_message)
    end
  end

  context "if it is not regular" do
    it "can't be created" do
      error_message = "All the sides of a square must be the same length"
      expect{Square.new(sides: [1,1,1,2])}.to raise_error(error_message)
    end
  end

  context "if it is valid" do
  a_square = Square.new(sides: [1,1,1,1])

    it "can be created" do
      expect(a_square.convert_sides_to_array).to eq([1,1,1,1])
    end
    it "calculates the correct perimeter" do
      expect(a_square.perimeter).to eq(4)
    end
    it "calculates the correct area" do
      expect(a_square.area).to eq(1)
    end
  end
end
