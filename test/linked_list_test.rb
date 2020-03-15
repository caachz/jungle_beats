require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list.rb'

class LinkedListTest < Minitest::Test
  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_its_head_starts_as_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_it_can_append_a_node
    list = LinkedList.new
    list.append("doop")

    assert_instance_of Node, list.head
    assert_equal "doop", list.head.data
  end

  def test_the_last_node_has_nil_for_next_node
    list = LinkedList.new
    list.append("doop")

    assert_nil list.head.next_node
  end

  def test_it_calculates_length_of_list
    list = LinkedList.new
    list.append("doop")

    assert_equal 1, list.count
  end

  def test_it_converts_all_data_to_string
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_it_can_append_more_than_one_node
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.head.data
    assert_nil list.head.next_node

    list.append("deep")

    assert_equal "doop", list.head.data
    assert_equal "deep", list.head.next_node.data
  end

  def test_it_counts_more_than_one_in_list
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal 2, list.count
  end

  def test_it_converts_multiple_nodes_to_string
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal "doop deep", list.to_string
  end

  def test_it_appends_and_prepends
    list = LinkedList.new
    list.append("plop")

    assert_equal "plop", list.to_string

    list.append("suu")
    list.prepend("dop")

    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end

  def test_it_can_insert_nodes_at_any_point_in_list
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end

  def test_it_can_find_elements
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string

    assert_equal "shi", list.find(2, 1)
    assert_equal "woo shi shu", list.find(1, 3)
  end

  def test_it_returns_if_the_list_includes_a_value
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal TRUE, list.includes?("deep")
    assert_equal FALSE, list.includes?("dep")
  end

  def test_it_removes_the_last_element_with_pop
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string

    list.pop

    assert_equal "deep woo shi shu", list.to_string

    list.pop

    assert_equal "deep woo shi", list.to_string
  end
end
