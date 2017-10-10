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
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
    else
      self.class.insert!(@root, value)
    end
  end

  def find(value)
    self.class.find!(@root, value)
  end

  def inorder
    self.class.inorder!(@root)
  end

  def postorder
    self.class.postorder!(@root)
  end

  def preorder
    self.class.preorder!(@root)
  end

  def height
    self.class.height!(@root)
  end

  def min
    self.class.min(@root)
  end

  def max
    self.class.max(@root)
  end

  def delete(value)
    self.class.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?
    if value <= node.value
      node.left = insert!(node.left, value)
    else
      node.right = insert!(node.right, value)
    end
    return node
  end

  def self.find!(node, value)
    return nil if node.nil?
    return node if node.value == value
    if value <= node.value
      find!(node.left, value)
    else
      find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] if node.nil?
    [node.value] + preorder!(node.left) + preorder!(node.right)
  end

  def self.inorder!(node)
    return [] if node.nil?
    inorder!(node.left) + [node.value] + inorder!(node.right)
  end

  def self.postorder!(node)
    return [] if node.nil?
    postorder!(node.left) + postorder!(node.right) + [node.value]
  end

  def self.height!(node)
    return -1 if node.nil?
    [height!(node.left), height!(node.right)].max + 1
  end

  def self.max(node)
    return node if node.right.nil?
    max(node.right)
  end

  def self.min(node)
    return node if node.left.nil?
    min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node
    if value < node.value
      node.left = delete!(node.left, value)
    elsif value > node.value
      node.right = delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      t = node
      node = t.right.min
      node.right = delete_min!(t.right)
      node.left = t.left
    end
    node
  end
end
