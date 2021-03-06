module Searchable
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |node|
      result = node.dfs(target_value)
      return result unless result == nil
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue.concat(node.children)
    end
  end
end

class PolyTreeNode
  include Searchable
  attr_accessor :value

  attr_reader :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if self.parent == node
    if self.parent
      self.parent.children.delete(self)
    end
    @parent = node
    self.parent.children << self unless self.parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" unless @children.include?(child_node)
    child_node.parent = nil
  end

end
