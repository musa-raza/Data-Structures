require 'byebug'
class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

end

class BinarySearchTree
  def initialize

  end

  def insert(value)

  end

  def find(value)

  end

  def inorder

  end

  def postorder

  end

  def preorder

  end

  def height

  end

  def min

  end

  def max

  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left = insert!(node.left, value)
    else
      node.right = insert!(node.right, value)
    end
    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    if value <= node.value
      return find!(node.left, value)
    else
      return find!(node.right, value)
    end
    node
  end

  def self.preorder!(node)

  end

  def self.inorder!(node)

  end

  def self.postorder!(node)

  end

  def self.height!(node)
    return -1 unless node
    return [height!(node.left), height!(node.right)].max + 1
  end

  def self.max(node)
    return node unless node.right
    max(node.right)
  end

  def self.min(node)
    return node unless node.left
    min(node.left)
  end

  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end
end
