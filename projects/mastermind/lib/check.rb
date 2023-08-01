module Check
  def check(input)
    while input.length != 4 do
      puts "Ваш код должен содержать 4 значения!"
      input = gets.chomp
    end
    input
  end
end
