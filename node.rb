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

  def find_min_descendant_node
    curr = self

    until curr.left.nil?
      curr = curr.left
    end

    curr
  end
end