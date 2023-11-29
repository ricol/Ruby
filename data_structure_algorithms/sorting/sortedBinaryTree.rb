#!/usr/bin/env ruby

class Node
  attr_reader :data, :left, :right
  attr_writer :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def to_s
    format("%3d", @data)
  end

  def printPreorder
    printf("%s\t", self)
    @left.printPreorder if @left
    @right.printPreorder if @right
  end

  def printPostorder
    @left.printPostorder if @left
    @right.printPostorder if @right
    printf("%s\t", self)
  end

  def printInOrder
    @left.printInOrder if @left
    printf("%s\t", self)
    @right.printInOrder if @right
  end
end

class Tree
  public

  def initialize(number)
    @head = Node.new(number)
  end

  def printPreorder
    @head.printPreorder
    puts
  end

  def printPostorder
    @head.printPostorder
    puts
  end

  def printInOrder
    @head.printInOrder
    puts
  end

  def add(number)
    addNumber(@head, number)
  end

  def find(number); end

  private

  def addNumber(node, number)
    if number > node.data
      if node.right
        addNumber(node.right, number)
      else
        temp = Node.new(number)
        node.right = temp
      end
    elsif number < node.data
      if node.left
        addNumber(node.left, number)
      else
        temp = Node.new(number)
        node.left = temp
      end
    else
      temp = Node.new(number, nil, node.right)
      node.right = temp
    end
  end
end

# build the tree
Num = 200
a = []
Num.times do
  a << rand(Num)
end

theTree = nil
a.each do |x|
  if !theTree
    theTree = Tree.new(x)
  else
    theTree.add(x)
  end
end
theTree.printInOrder
