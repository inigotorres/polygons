require './polygon.rb'

describe "A polygon" do
  context "if it has non-positive sides" do
    it "can't be created" do
      expect{Polygon.new(sides: [-1])}.to raise_error
    end
  end
end
