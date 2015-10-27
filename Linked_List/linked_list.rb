require_relative 'node'
require 'pry'

class LinkedList
  attr_reader :list

  def initialize(list)
    @list = add_nodes(list)
  end

  def add_nodes(list)
    return if list.empty?
    node = Node.new(list.shift)
    node.next = add_nodes(list)
    node
  end

  def count
    return 1 if @list.next == nil
    node_count = 1
    node = @list.next
    loop do
      node_count += 1
      break if node.next.nil?
      node = node.next
    end
    node_count
  end

  def includes?(item)
    node = @list
    data = @list.data
    loop do
      return true if data == item
      break if node.next.nil?
      node = node.next
      data = node.data
    end
    false
  end
end

# linked_list = LinkedList.new(['first', 'second', 'third', 'fourth'])
# p linked_list.list
# puts "there are #{linked_list.count} nodes in the list"
