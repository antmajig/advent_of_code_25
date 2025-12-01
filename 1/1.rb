class Node
  def initialize(data, n, p)
    @data = data
    @n = n
    @p = p
  end

  attr_accessor :data, :n, :p
end

def part_one
  input = File.readlines("input.txt")

  head = initialize_list
  position = move_to_start(head)
  count = 0

  input.each do |i|
    regex = /\d+/
    number = i.scan(regex)[0].to_i

    if i[0] == "L"
      while(number > 0)
        position = position.p
        number -= 1
      end
    else
      while(number > 0)
        position = position.n
        number -= 1
      end
    end


    count += 1 if position.data == 0
  end
  
  puts count
end

def part_two
  input = File.readlines("input.txt")

  head = initialize_list
  position = move_to_start(head)
  count = 0

  input.each do |i|
    regex = /\d+/
    number = i.scan(regex)[0].to_i

    if i[0] == "L"
      while(number > 0)
        position = position.p
        count += 1 if position.data == 0
        number -= 1
      end
    else
      while(number > 0)
        position = position.n
        count += 1 if position.data == 0
        number -= 1
      end
    end
  end
  
  puts count
end

def initialize_list
  head = nil
  previous = nil
  node = nil

  100.times do |i|
    node = Node.new(i,nil,previous)
    head = node if head == nil
    previous.n = node if previous != nil
    previous = node
  end
  
  node.n = head
  head.p = node

  head
end

def move_to_start(head)
  start = head
  50.times do
    start = start.n
  end
  
  start
end

def print_list(head)
  node = head
  100.times do
    puts node.data
    node = node.n
  end
end

part_two
