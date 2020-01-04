require './linked_list.rb'
require './node.rb'

list1 = LinkedList.new(1)
list1.append('dog')
list1.prepend('cat')

test_array = Array.new(30) {rand(0..200)}
test_array.each {|i| list1.prepend(i)}

puts list1.to_s
puts list1.at(1).val
list1.pop
list1.insert_at(1, 'whale')
puts list1.to_s
puts list1.contains? 'mouse'
puts list1.find('whale')
list1.remove_at(1)
puts list1.to_s
