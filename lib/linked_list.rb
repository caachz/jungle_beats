require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    list = @head
    until list.next_node == nil
      list = list.next_node
    end
    list
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      tail.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      @head = Node.new(data, @head)
    end
  end

  def insert(position, data)
    list = @head
    (position - 1).times do
      list = list.next_node
    end
    list.next_node = Node.new(data, list.next_node)
    @head = list
  end

  def count
    return 0 if @head == nil
    list = @head
    result = 1
    until list.next_node == nil
      result += 1
      list = list.next_node
    end
    result
  end

  def to_string
    return "" if @head == nil
    return @head.data if count == 1
    list = @head
    result = ""
    until list == nil
      result = result + " " + list.data
      list = list.next_node
    end
    result.delete_suffix(" ").delete_prefix(" ")
  end

  def find(position, elements)
    list = @head

    position.times do
      list = list.next_node
    end

    result = ""

    elements.times do
      result = result + " " + list.data
      list = list.next_node
    end

    result.delete_suffix(" ").delete_prefix(" ")
  end

  def includes?(value)
    list = @head

    until list == nil
      return true if list.data == value
      list = list.next_node
    end
    false
  end

  def pop
    list = @head

    until list.next_node.next_node == nil
      list = list.next_node
    end
    list.next_node = nil
  end
end
