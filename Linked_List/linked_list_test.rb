require_relative 'linked_list'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test
  def test_counts_lists_of_length_1
    linked_list = LinkedList.new(['first'])
    assert_equal 1, linked_list.count
  end

  def test_counts_lists_of_length_2
    linked_list = LinkedList.new(['first', 'second'])
    assert_equal 2, linked_list.count
  end

  def test_counts_lists_of_length_3
    linked_list = LinkedList.new(['first', 'second', 'third'])
    assert_equal 3, linked_list.count
  end

  def test_counts_lists_of_length_4
    linked_list = LinkedList.new(['first', 'second', 'third', 'fourth'])
    assert_equal 4, linked_list.count
  end

  def test_counts_lists_of_length_5
    linked_list = LinkedList.new(['first', 'second', 'third', 'fourth', 'fifth'])
    assert_equal 5, linked_list.count
  end

  def test_returns_true_if_includes_given_value
    linked_list = LinkedList.new(['alia', 'ziggy', 'al'])
    assert linked_list.includes?('ziggy')
    assert linked_list.includes?('al')
  end

  def test_returns_false_if_does_not_include
    linked_list = LinkedList.new(['alia', 'ziggy', 'al'])
    refute linked_list.includes?('astro')
  end
end
