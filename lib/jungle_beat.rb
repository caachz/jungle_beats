require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data = data.split
    data.each do |piece|
      @list.append(piece)
    end
  end

  def count
    @list.count
  end
end
