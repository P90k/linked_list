# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList < Node
  attr_reader :head, :tail

  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  def append(value)
    node = Node.new(value)
    return @head = node if @head.nil?

    @tail.nil? ? @head.next_node = node : @tail.next_node = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def size(list = head)
    return 0 if list.nil?

    1 + size(list.next_node)
  end

  def at(index)
    return nil if size <= index
    return @head if index.zero?

    node = head.next_node
    (index - 1).times { node = node.next_node }
    node
  end

  def pop
    node = head
    new_tail_index = size - 2
    new_tail_index.times { node = node.next_node }
    node.next_node = nil
    @tail = node
  end

  def contains?(value)
    (0...size).each { |i| return true if at(i).value == value }
    false
  end

  def find(value)
    (0...size).each { |i| return i if at(i).value == value }
    nil
  end

  def to_s(list = head)
    return 'nil' if list.nil?

    "( #{list.value} ) -> #{to_s(list.next_node)}"
  end

  def insert_at(value, index)
    previous_node = at(index - 1)
    current_node = at(index)
    node = Node.new(value, current_node) # node will now point to current_node
    previous_node.next_node = node # make previous node point to node
  end

  def remove_at(index)
    previous_node = at(index - 1)
    new_next_node = at(index + 1)
    previous_node.next_node = new_next_node
  end
end

# example code to test methods
list = LinkedList.new(Node.new('A'))
list.append('B')
list.append('C')
p list.to_s