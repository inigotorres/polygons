class Side
  attr_reader :length
 
  def initialize length
    @length = length
    raise 'Side length must be positive' unless valid?
  end

  def valid?
    @length > 0
  end
 
  def to_s
    @length
  end
end
