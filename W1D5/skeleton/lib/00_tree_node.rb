require 'byebug'

class PolyTreeNode
  attr_reader :value, :parent, :children
  # def parent
  #   @parent
  # end
  # attr_writer :parent
  # def parent=(new_value)
  #   @parent = new_value
  # end

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(node)
    if @parent
      self.parent.children.delete(self)
    end

    @parent = node
    if node
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    unless self.children.include?(child_node)
      raise 'This is not a child node of this instance'
    else
      child_node.parent = nil
    end
  end

  def inspect
    # @parent = "tommy"
    "This is the parent: #{self.children}"
  end

  def dfs(target_val)
    return nil if self.nil?
    return self if self.value == target_val

    self.children.each do |child|
      result = child.dfs(target_val)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_val)
    queue = []
    queue << self

    until queue.empty?
      node = queue.shift
      return node if node.value == target_val
      node.children.each do |child|
        queue << child
      end
    end
    nil
  end



end

# p = PolyTreeNode.new(5)
#
# p.parent = "tommy"
