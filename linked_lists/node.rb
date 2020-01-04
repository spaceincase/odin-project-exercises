class Node

  attr_accessor :val, :next_node

  def initialize(val = nil, next_node = nil)
    self.val = val
    self.next_node = next_node
  end
  
end
