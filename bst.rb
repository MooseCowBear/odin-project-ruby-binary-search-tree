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

  def insert(value, node = root)
    #need to find the first place the value will go
    if node.nil? 
      new_node = Node.new(value)
      if root.nil? 
        self.root = new_node
      end
      new_node #do we need this?
    else
      if node.value == value
        return node
      elsif node.value < value
        node.right = insert(value, node.right)
      else 
        node.left = insert(value, node.left)
      end
      node
    end
  end

  def delete(value)

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

test.insert(8)
test.pretty_print

test.insert(7)
test.pretty_print

test.insert(0)
test.pretty_print

test.insert(2)
test.pretty_print

test2 = Tree.new([])

test2.insert(1)
test2.pretty_print
test2.insert(3)
test2.pretty_print
test2.insert(5)
test2.pretty_print

puts test.root.find_min_descendant_node.value