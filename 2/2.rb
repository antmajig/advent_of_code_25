def part_one
  file = File.read("input.txt")
  input = file.split(",")

  count = 0
  input.each do |i|
    regex = /\d+/
    range = i.scan(regex).map(&:to_i)
    for x in (range[0]..range[1]) do
      count += x if has_repeating_number?(x) 
    end
  end
  puts count
end

def part_two
  file = File.read("input.txt")
  input = file.split(",")

  count = 0
  input.each do |i|
    regex = /\d+/
    range = i.scan(regex).map(&:to_i)
    for x in (range[0]..range[1]) do
      count += x if is_recurring_number?(x)
    end
  end

  puts count
end

def has_repeating_number?(number)
  number_s = number.to_s
  return false unless (number_s.length % 2) == 0

  half = number_s.chars.each_slice(number_s.length / 2).map(&:join)

  half[0] == half[1]
end

def is_recurring_number?(number)
  number_s = number.to_s
  return false if number_s.length < 2

  for x in (1..number_s.length/2)
    return true if number_s.chars.each_slice(x).map(&:join).uniq.length == 1
  end

  false
end

part_two
