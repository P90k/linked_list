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
    @size = 1
  end

  def append(node)
    return @head = node if @head.nil?
    @tail.nil? ? @head.next_node = node : @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(node)
    node.next_node = @head
    @head = node
    @size += 1
  end

  def size(list)
    return 0 if list == nil
    1 + size(list.next_node)
  end
end



list = LinkedList.new(Node.new('A'))
list.append(Node.new('B'))
list.append(Node.new('C'))
list.append(Node.new('D'))
list.prepend(Node.new('Hi'))
p list.size