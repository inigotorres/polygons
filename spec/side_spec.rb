require './side'

describe "A side" do
  it "can be created and has property length" do
    a_side = Side.new(3)
    expect(a_side.length).to eq(3)
  end
  it "is not created if its side is 0 or negative" do
    expect{Side.new(-1)}.to raise_error
  end
end
