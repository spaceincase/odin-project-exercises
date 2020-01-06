class Node
  include Comparable

  attr_accessor :val, :left, :right

  def initialize(value = nil)
    @val = value
    @left = nil
    @right = nil
  end

  def is_leaf?
    self.left.nil? && self.right.nil?
  end

  def one_child?
    (self.left.nil? || self.right.nil?) && !self.is_leaf?
  end

  def <=>(value)
    if value.is_a? Node
      @val <=> value.val
    else
      @val <=> value
    end
  end
end
