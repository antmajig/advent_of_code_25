def part_one
  input = File.readlines("input.txt").map(&:chomp)

  count = 0
  input.each do |line|
    p line
    first_digit = ""
    first_digit_index = 0
    second_digit = ""

    (0..9).reverse_each do |x|
      (line.length-1).times do |n|
        if line[n].to_i == x
          first_digit = line[n]
          first_digit_index = n
          break;
        end
      end

      break if first_digit != ""
    end

    (0..9).reverse_each do |x|
      (first_digit_index+1..line.length).each do |n|
        if line[n].to_i == x
          second_digit = line[n]
          break;
        end
      end

      break if second_digit != ""
    end

    puts "#{first_digit}#{second_digit}"
    count += (first_digit + second_digit).to_i
  end
  
  puts count
end

def part_two
  input = File.readlines("input.txt").map(&:chomp)

  count = 0
  input.each do |line|
    digits_left = 12
    digits = []
    current_index = 0
   
    while(digits_left > 0) do
      (0..9).reverse_each do |x|
        found = false
        (current_index..line.length-digits_left).each do |n|
          if line[n].to_i == x
            digits << line[n]
            current_index = n + 1
            digits_left -= 1
            found = true
            break;
          end
        end
        
        break if found
      end
    end
    count +=  digits.join.to_i 
  end
  
  puts count
end

part_two
