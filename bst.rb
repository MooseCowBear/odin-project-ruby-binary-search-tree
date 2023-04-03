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

class Tree
  def initialize(arr)
    @root = build_tree(arr)
  end

  attr_accessor :root

  def build_tree(arr)
    arr = arr.uniq.sort
    return nil if arr.length == 0

    mid = arr.length / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr[...mid])
    root.right = build_tree(arr[mid + 1...])

    return root
  end

  def insert(value)
    #need to find the first place the value will go

  end

  def find(value, node = root) #but then doesn't apply to root.right...bc its a node not a tree
    return node if node.nil? || node.value == value

    return find(value, node.right) if node.value < value

    return find(value, node.left)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

test = Tree.new([1, 2, 3, 4, 5, 6])
test.pretty_print

found = test.find(2)
puts found.left.value
puts found.right.value