module GiveHints
  def give_hints(input, code)
    red_counter = 0
    white_counter = 0
    temp_secret_code = code.dup

    input.split("").map(&:to_i).each_with_index do |num, i|
      if num == temp_secret_code[i]
        red_counter += 1
        temp_secret_code[i] = nil
      end
    end

    input.split("").map(&:to_i).each do |num|
      if temp_secret_code.include?(num) && temp_secret_code[temp_secret_code.index(num)] != nil
        white_counter += 1
        temp_secret_code[temp_secret_code.index(num)] = nil
      end
    end

    puts "на своих местах: #{red_counter}"
    puts "угадал но не на своих местах: #{white_counter}"
  end
end
