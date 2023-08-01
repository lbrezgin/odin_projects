class UserCode

  attr_accessor :secret_code

  def initialize(code)
    @secret_code = code.split("").map(&:to_i)
  end

  def check_user_code
    while self.secret_code.length != 4
      puts "Ваш код должен содеражать 4 значения!"
      input = gets.chomp
      self.secret_code = input
    end
    self.secret_code
  end
end
