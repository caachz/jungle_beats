require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_it_exists
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
  end

  def test_it_is_instantiated_with_a_linked_list
    jb = JungleBeat.new

    assert_instance_of LinkedList, jb.list
  end

  def test_its_linked_list_starts_off_empty
    jb = JungleBeat.new

    assert_nil jb.list.head
  end

  def test_it_can_append_multiple_nodes_to_linked_list_at_once
    jb = JungleBeat.new

    jb.append("deep doo ditt")

    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data

    jb.append("woo hoo shu")

    assert_equal 6, jb.count
  end
end
