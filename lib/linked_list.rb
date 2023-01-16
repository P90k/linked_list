# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node
  def initialize(data=nil, next_node=nil)
    @value = data
    @next_node = next_node
  end
end

class LinkedList < Node
  attr_reader :head, :tail
  def initialize(head=nil, tail=nil)
    @head = head
    @tail = tail
  end

  def append(node)
    return @head = node if @head.nil?
    @tail.nil? ? @head.next_node = node : @tail.next_node = node
    @tail = node
  end

  def prepend(node)
    node.next_node = @head
    @head = node
  end

  def size(list=self.head)
    return 0 if list == nil
    1 + size(list.next_node)
  end

  def at(index)
    return nil if self.size <= index
    return @head.value if index == 0
    node = self.head.next_node
    (index-1).times { node = node.next_node }
    node.value
  end

  def pop
    node = self.head
    new_tail_index = self.size - 2
    new_tail_index.times { node = node.next_node }
    node.next_node = nil
    @tail = node
  end
  
  def contains?(value)
    for i in 0...self.size
      return true if self.at(i) == value
    end
    false
  end
end


# example code to test methods
list = LinkedList.new(Node.new('A'))
list.append(Node.new('B'))
list.append(Node.new('C'))
list.append(Node.new('D'))
list.append(Node.new('E'))
list.prepend(Node.new('Hi'))