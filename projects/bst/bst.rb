# frozen_string_literal: true

# Represents a node in a binary tree.
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

# Represent binary tree at all
class BST
  attr_accessor :root, :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(value)
    if @root == nil
      @root = Node.new(value)
    else
      curr_node = @root
      prev_node = @root
      while curr_node != nil
        prev_node = curr_node

        if value < curr_node.value
          curr_node = curr_node.left
        else
         curr_node = curr_node.right
        end
      end

      if value < prev_node.value
        prev_node.left = Node.new(value)
      else
        prev_node.right = Node.new(value)
      end
    end
    @size += 1
  end

  def delete(item)
    #delete item from binary tree
  end

  def build_tree(array)
    array.uniq.each do |item|
      insert(item)
    end
    return @root.value
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

new_tree = BST.new
new_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 67, 6345, 324])
new_tree.pretty_print
new_tree.insert(1)
new_tree.pretty_print
