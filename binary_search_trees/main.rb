require './node.rb'
require './tree.rb'

def print_tree_orders(tree)
  puts "Level Order: #{tree.level_order.join(' ')}"
  puts "Inorder DFS: #{tree.inorder.join(' ')}"
  puts "Preorder DFS: #{tree.preorder.join(' ')}"
  puts "Postorder DFS: #{tree.postorder.join(' ')}"
end

puts "1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)"
  test_array = Array.new(15) {rand(1..100)}
  puts "Array: #{test_array}"
  tree = Tree.new(test_array)
  puts "Tree: #{tree}"
puts "2. Confirm that the tree is balanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "3. Print out all elements in level, pre, post, and in order"
  print_tree_orders(tree)
puts "4. try to unbalance the tree by adding several numbers > 100"
  tree.insert(101)
  tree.insert(102)
  tree.insert(103)
  tree.delete(101)
puts "5. Confirm that the tree is unbalanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "6. Balance the tree by calling `#rebalance!`"
  tree.rebalance!
  print_tree_orders(tree)
puts "7. Confirm that the tree is balanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "8. Print out all elements in level, pre, post, and in order"
  puts "Breadth-Firsth:"
  print_tree_orders(tree)
