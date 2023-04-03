require_relative './node.rb'

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

  def delete(value, node = root)
    return node if node.nil? 

    if value < node.value
      node.left = delete(value, node.left)
    elsif value > node.value
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        temp, node = node.right, nil
        return temp
      elsif node.right.nil?
        temp, node = node.left, nil
        return temp
      end
      temp = node.right.find_min_descendant_node
      node.value = temp.value
      node.right = delete(temp.value, node.right)
    end
    return node
  end

  def find(value, node = root) 
    return node if node.nil? || node.value == value

    return find(value, node.right) if node.value < value

    return find(value, node.left)
  end

  def level_order
    q = []
    arr = []
    q << root unless root.nil?
    while q.length > 0
      curr = q.shift
      q << curr.left unless curr.left.nil? 
      q << curr.right unless curr.right.nil?
      yield curr if block_given?
      arr << curr.value unless block_given?
    end
    return arr unless block_given?
  end

  def level_order_rec
    height = height(root)
    1.upto(height) do |i|

    end
  end

  def inorder(node = root, arr = [], &block)
      return arr if node.nil? 

      arr = inorder(node.left, arr, &block)
      block.call(node) if block_given?
      arr << node.value 
      arr = inorder(node.right, arr, &block)
  end

  def preorder(node = root, arr = [], &block)
    return arr if node.nil?

    block.call(node) if block_given?
    arr << node.value
    arr = preorder(node.left, arr, &block)
    arr = preorder(node.right, arr, &block)
  end

  def postorder(node = root, arr = [], &block)
    return arr if node.nil?

    arr = postorder(node.left, arr, &block)
    arr = postorder(node.right, arr, &block)
    block.call(node) if block_given?
    arr << node.value
  end

  def height(node) 
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    return [left_height, right_height].max + 1    
  end

  def depth(node) 
    return 0 if node.value == root.value

    level = 0
    curr = root
    until node.value == curr.value
      level += 1

      if node.value < curr.value
        curr = curr.left
      else 
        curr = curr.right
      end
    end
    return level
  end

  def balanced?(node = root)
    return true if node.nil?
    balanced?(node.left) && balanced?(node.right) && (height(node.left) - height(node.right)).abs <= 1
  end

  def rebalance
    arr = self.inorder
    self.root = build_tree(arr)
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

test.insert(7)

test.insert(0)

test.insert(2)
test.pretty_print

test.delete(8)
test.pretty_print

test.delete(5)
test.pretty_print

test.delete(4)
test.pretty_print

puts test.balanced?

test2 = Tree.new([1,2,3])
test2.pretty_print
puts test2.balanced?

puts "After rebalance"
test.rebalance
test.pretty_print