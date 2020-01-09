class Knight

  attr_reader :current_location
  CONTRAINTS = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]

  def initialize(location)
    @current_location = location
  end

  def path_to?(location)
    queue = [ @current_location ]
    visited = [ @current_location ]
    paths = {}

    until queue.empty?
      node = queue.shift
      children = moves?(node).sort

      children.each do |child|
        unless visited.include? child
          visited << child
          paths[child] = node
          queue << child
        end

        return get_path(location, paths) + [location] if node == location
      end
    end
  end

  def get_path(node, list)
    stack = [ node ]
    path = []

    until stack.empty?
      start = stack.pop
      path << list[start]
      stack << list[start] unless list[start].nil?
    end

    path.compact.reverse
  end

  def moves?(current = @current_location)
    CONTRAINTS.map do |move|
      move.zip(current).map {|move,location| move + location}
    end
    .select {|move| valid?(move)}
  end

  def valid?(location)
    location[0] >= 0 && location[0] < 8 && location[1] >= 0 && location[1] < 8
  end

end

p Knight.new([3,3]).path_to?([4,3])
