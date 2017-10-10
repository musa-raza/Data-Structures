class PolyTreeNode

  attr_accessor :value

  attr_reader :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if self.parent == node
    @parent.children.delete(self) if @parent
    @parent = node
    self.parent.children << self unless self.parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

end
