# Odin Project Binary Search Tree

A Ruby implementation of a binary search tree. 

## Methods Implemented

| Method | Description |
| -- | -- |
| #build_tree | takes array, produces balanced BST |
| #insert | insert node with new value into the tree |
| #delete | delete node with value from tree |
| #find | return node with value from tree, or nil if not present |
| #level_order | returns array of values if no block given, else applies block to nodes in tree in level order |
| #level_order_rec | recursive version of above |
| #inorder | returns array of values if no block given, else applied block to nodes in tree in inorder |
| #preorder | returns array of values if no block given, else applied block to nodes in tree in preorder |
| #postorder | returns array of values if no block given, else applied block to nodes in tree in postorder |
| #height(node) | return height of node |
| #depth(node) | returns depth of node | 
| #balanced? | returns true if tree is balanced, false otherwise |
| #rebalance | rebuilds tree to be balanced | 