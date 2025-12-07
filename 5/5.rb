def part_one
  file = File.readlines("input.txt").map(&:chomp)
  file_split_index = file.find_index("") 

  ranges = file[0...file_split_index] 
  ingredients = file[file_split_index+1..]
  
  fresh_count = 0
  ingredients.each do |i|
    fresh_count += 1 if is_fresh(i.to_i, ranges)
  end

  p fresh_count
end

def is_fresh(ingredient, ranges)
  ranges.each do |range|
    regex = /\d+/
    values = range.scan(regex).map(&:to_i)
    return true if (values[0]..values[1]).include?(ingredient)
  end

  false
end

def part_two
  file = File.readlines("input.txt").map(&:chomp)
  file_split_index = file.find_index("") 

  ranges = file[0...file_split_index] 
  ranges = convert_to_ranges(ranges)

  # The 1000 times and shuffle biggest hack ever
  1000.times do
    ranges = merge_ranges(ranges).shuffle
  end

  count_ids = 0 
  ranges.each do |r|
    count_ids += r.size
  end

  p ranges
  p count_ids
end

def convert_to_ranges(ranges)
  merged_ranges = []
  ranges.each do |range|
    regex = /\d+/
    values = range.scan(regex).map(&:to_i)
    merged_ranges << (values[0]..values[1])
  end

  merged_ranges
end

def merge_ranges(ranges)
  merged_ranges = []

  ranges.each do |range|
    range_merged = false
    merged_ranges.each_with_index do |m_r, index|
      if m_r.include?(range.first) && m_r.include?(range.last)
        range_merged = true
        break;
      elsif m_r.include?(range.first)
        merged_ranges[index] = (m_r.first..range.last) 
        range_merged = true
        break;
      elsif m_r.include?(range.last)
        merged_ranges[index] = (range.first..m_r.last) 
        range_merged = true
        break;
      end
    end

    merged_ranges << (range.first..range.last) unless range_merged
  end

  merged_ranges
end

part_two
