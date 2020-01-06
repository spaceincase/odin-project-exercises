class Tree

  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    # Base-cases for recursion
    return nil unless array[0]
    return Node.new(array[0]) if array.length < 2
    # Sort array and remove duplicate values
    array.sort!.uniq!
    mid = array.length / 2
    # Create root node from the mid element of the sorted input array
    root = Node.new(array[mid])
    # Create left and right subtrees through recursive calls to build_tree
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1..-1])
    # Implicit return of root node
    root
  end

  def insert(value, node = @root)
    # Return node if value already exists in tree
    if node == value
      node
    # Traverse left sub tree if value is smaller than node
    elsif node > value
      node.left ? insert(value, node.left) : node.left = Node.new(value)
    # Traverse right sub tree if value is greater than node
    elsif node < value
      node.right ? insert(value, node.right) : node.right = Node.new(value)
    end
  end

  def level_order
    # Start a queue with root and initialize data[]
    queue = [@root]
    data = []
    # Iterate through queue
    until queue.empty?
      # Select and remove next node in queue
      node = queue.shift
      # Either yeild(node) or push node into data[]
      block_given? ? yield(node) : data << node.val
      # Add left and right children to queue
      queue << node.left if node.left
      queue << node.right if node.right
    end
    # Return data array if no block given
    data unless block_given?
  end

  def find(value)
    # Use level_order method to find node
    # Implicit return
    level_order {|node| return node if node == value}
    # Also added Enumerable for lawlz!
    # @root.each {|node| return node if node == value}
  end

  # Super-duper Bonus!
  ORDERS = ['preorder', 'inorder', 'postorder'].each do |method|
    define_method "#{method}" do |node = @root, &block|
      # Base-case
      return unless node
      data = []
      # If preorder, either yield(node.val) or push node.val into data[]
      block ? block.call(node.val) : data << node.val if method == ORDERS[0]
      data << self.send(method, node.left, &block)
      # If inorder, either yield(node.val) or push node.val into data[]
      block ? block.call(node.val) : data << node.val if method == ORDERS[1]
      data << self.send(method, node.right, &block)
      # If postorder, either yield(node.val) or push node.val into data[]
      block ? block.call(node.val) : data << node.val if method == ORDERS[2]
      # Compact and flatten the return array removing nils and concating subarrays
      data.compact.flatten unless block
    end
  end

  def delete(value)
    # Find node with value to delete
    node = self.find(value)
    # Find node's parent node
    parent = nil
    self.level_order {|n| parent = n if (n.left == node || n.right == node)}
    # If node is a leaf remove it from it's parent
    if node.is_leaf?
      parent.left == node ? parent.left = nil : parent.right = nil
    # If node has one child replace node with child in parent node
    elsif node.one_child?
      if parent.left == node
        parent.left = node.left ? node.left : node.right
      else
        parent.right = node.left ? node.left : node.right
      end
    # If node has 2 children, replace node with node.right
    # and set node.right.left = node.left
    else
      replacement = node.right
      if parent.left == node
        parent.left = replacement
        replacement.left = node.left
      else
        parent.right = replacement
        replacement.right = node.right
      end
    end
  end

  def depth(node = @root)
    # Base-case
    return 0 if node.nil?
    # Traverse left and right subtrees
    left = depth(node.left)
    right = depth(node.right)
    # Implicit return of largest subtree depth
    left > right ? left+1 : right+1
  end

  def balanced?
    # Implicit return of absolute value of left - right subtrees
    (depth(@root.left) - depth(@root.right)).abs <= 1
  end

  def rebalance!
    # Set root node to new tree's root node.
    @root = build_tree(level_order)
  end



end
