class LinkedList
  require_relative 'node'

  attr_accessor :head, :tail, :size

  def initialize(data)
    self.head = Node.new(data)
    self.tail = @head
    self.size = 1
  end

  def append(data)
    node = Node.new(data)
    @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(data)
    node = Node.new(data, @head)
    @head = node
    @size += 1
  end

  def at(index)
    return nil if index > self.size
    node = @head
    index.times {node = node.next_node}
    node
  end

  def pop
    @tail = self.at(@size - 2)
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(data)
    node = @head
    @size.times do
      return true if data == node.val
      node = node.next_node if node.next_node
    end
    false
  end

  def find(data)
    return nil unless self.contains?(data)
    node = @head
    @size.times do |i|
      return i if data == node.val
      node = node.next_node if node.next_node
    end
    nil
  end

  def to_s
    str = ""
    node = @head
    while node
      str << "( #{node.val} ) -> "
      node = node.next_node
    end
    str + 'nil'
  end

  def insert_at(index, data = nil)
    return nil if index > self.size
    node = Node.new(data, self.at(index + 1))
    self.at(index - 1).next_node = node
    @size += 1
  end

  def remove_at(index)
    return nil if index > self.size
    self.at(index -1).next_node = self.at(index + 1)
    @size -= 1
  end

end
