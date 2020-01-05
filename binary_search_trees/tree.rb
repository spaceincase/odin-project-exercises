class Tree
  require_relative 'node'

  attr_accessor :root

  def initialize(arr = [])
    self.root = build_tree(arr)
  end

  def build_tree(arr)
    arr.sort!
    arr.uniq!
    if arr.length < 2
      return Node.new(arr[0]) if arr[0]
      return nil
    else
      mid = arr.length / 2
      left = arr[0...mid]
      right = arr[mid + 1..-1]
      root = Node.new(arr[mid])
      root.left = build_tree(left)
      root.right = build_tree(right)
    end
    root
  end

  def insert(value, node = @root)
    if value < node.val && node.left
      insert(value, node.left)
    elsif value > node.val && node.right
      insert(value, node.right)
    else
      value < node.val ? node.left = Node.new(value) : node.right = Node.new(value)
    end
  end

  def delete

  end

  def find(value)
    level_order {|node| return node if node.val == value}
  end

  def depth(node = @root)
    if node.nil?
      return 0
    else
      left = depth(node.left)
      right = depth(node.right)
      return left > right ? left + 1 : right + 1
    end
  end

  def level_order
    queue = [@root]
    data = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : data << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
    return data unless block_given?
  end

  def inorder(root = @root)
    data = []
    return unless root
    data.push(
      *inorder(root.left),
      root,
      *inorder(root.right)
    )
    data.each {|node| yield(node)} if block_given?
    data unless block_given?
  end

  def preorder(root = @root)
    data = []
    return unless root
    data.push(
      root,
      *inorder(root.left),
      *inorder(root.right)
    )
    data.each {|node| yield(node)} if block_given?
    data unless block_given?
  end

  def postorder(root= @root)
    data = []
    return unless root
    data.push(
      *inorder(root.left),
      *inorder(root.right),
      root
    )
    data.each {|node| yield(node)} if block_given?
    data unless block_given?
  end

  def balanced?
    left = @root.left
    right = @root.right
    return (depth(left) - depth(right)).abs <= 1
  end

  def rebalance!
    @root = build_tree(self.level_order)
  end

end
