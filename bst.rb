class Node
  include Comparable
  
  def initialize(value)
    @value = value
    @left = left
    @right = right
  end

  attr_accessor :value, :left, :right

  def <=>(other)
      value <=> other.value
  end
end


