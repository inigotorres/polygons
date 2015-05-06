require './rectangle.rb'

describe "A rectangle" do
  context "if it doesn't have exactly four sides" do
    it "can't be created" do
      error_message = "A rectangle must have four sides"
      expect{Rectangle.new(sides: [2,2,3,3,3])}.to raise_error(error_message)
    end
  end
  context "if it is regular" do
    it "can't be created" do
      error_message = "A rectangle can't be regular"
      expect{Rectangle.new(sides: [1,1,1,1])}.to raise_error(error_message)
    end
  end
  context "if it doesn't have equal opposite sides" do
    it "can't be created" do
      error_message = "A rectangle must have equal opposite sides"
      expect{Rectangle.new(sides: [2,1,2,2])}.to raise_error(error_message)
      expect{Rectangle.new(sides: [2,2,3,4])}.to raise_error(error_message)
    end
  end

  context "if it is valid" do
    a_rectangle = Rectangle.new(sides: [2,2,1,1])

    it "can be created" do
      expect(a_rectangle.convert_sides_to_array).to eq([2,2,1,1])
    end
    it "calculates the correct perimeter" do
      expect(a_rectangle.perimeter).to eq(6)
    end
    it "calculates the correct area" do
      expect(a_rectangle.area).to eq(2)
    end
  end
end
