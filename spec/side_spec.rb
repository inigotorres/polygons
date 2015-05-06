require './side'

describe "A side" do
  context "if its length is 0 or negative" do
    it "can't be created" do
      expect{Side.new(-1)}.to raise_error
    end
  end

  context "if it is valid" do
    it "can be created and has property length" do
      a_side = Side.new(3)
      expect(a_side.length).to eq(3)
    end
  end
end
