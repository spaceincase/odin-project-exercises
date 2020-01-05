class Node
  include Comparable
  attr_accessor :val, :left, :right

  def initialize(val, left = nil, right = nil)
    self.val = val
    self.left = left
    self.right = right
  end

  def <=>(node)
    @val <=> node.val
  end
end
