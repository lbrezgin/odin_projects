class Field
  attr_reader :field, :nums

  include MyPlayer

  def initialize
    @field = [
      " 1 | 2 | 3 ",
      "---|---|---",
      " 4 | 5 | 6 ",
      "---|---|---",
      " 7 | 8 | 9 "
    ]
    @nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def move_on_field(num, r)
    until self.nums.include?(num)
      puts "Выберете число от 1 до 9!"
      num = gets.chomp
    end

    self.field.each do |value|
      for i in 0..(value.length)
        if value[i] == num
          value[i] = r
        end
        i+=1
      end
    end
    puts self.field
    return num
  end
end

