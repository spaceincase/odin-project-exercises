require './node.rb'
require './tree.rb'

puts "1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)"
  test_array = Array.new(15) {rand(1..100)}
  puts "Array: #{test_array}"
  tree = Tree.new(test_array)
  puts "Tree: #{tree}"
puts "2. Confirm that the tree is balanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "3. Print out all elements in level, pre, post, and in order"
  puts "Breadth-Firsth:"
  puts tree.level_order {|node| print "#{node.val} "}
  puts "Inorder DFS:"
  puts tree.inorder {|node| print "#{node.val} "}
  puts "Preorder DFS:"
  puts tree.preorder {|node| print "#{node.val} "}
  puts "Postorder DFS:"
  puts tree.postorder {|node| print "#{node.val} "}
puts "4. try to unbalance the tree by adding several numbers > 100"
  tree.insert(101)
  tree.insert(102)
  tree.insert(103)
  puts tree.level_order {|node| print "#{node.val} "}
  tree.delete(101)
  puts tree.level_order {|node| print "#{node.val} "}
puts "5. Confirm that the tree is unbalanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "6. Balance the tree by calling `#rebalance!`"
  tree.rebalance!
  puts tree.level_order {|node| print "#{node.val} "}
puts "7. Confirm that the tree is balanced by calling `#balanced?`"
  puts "Balanced?: #{tree.balanced?}"
puts "8. Print out all elements in level, pre, post, and in order"
  puts "Breadth-Firsth:"
  puts tree.level_order {|node| print "#{node.val} "}
  puts "Inorder DFS:"
  puts tree.inorder {|node| print "#{node.val} "}
  puts "Preorder DFS:"
  puts tree.preorder {|node| print "#{node.val} "}
  puts "Postorder DFS:"
  puts tree.postorder {|node| print "#{node.val} "}
