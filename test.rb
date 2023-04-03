require_relative './bst.rb'

my_tree = Tree.new(Array.new(15) { rand(1..100) })

my_tree.pretty_print

puts my_tree.balanced?

pp my_tree.level_order

pp my_tree.preorder

pp my_tree.postorder

pp my_tree.inorder

20.times do |i|
  my_tree.insert(rand(100..200))
end

my_tree.pretty_print

puts my_tree.balanced?

my_tree.rebalance

my_tree.pretty_print

puts my_tree.balanced?

pp my_tree.level_order

pp my_tree.preorder

pp my_tree.postorder

pp my_tree.inorder