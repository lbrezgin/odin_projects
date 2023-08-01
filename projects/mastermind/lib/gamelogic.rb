require_relative "check.rb"
require_relative "give_hints.rb"
require_relative "start_with_computer.rb"

class GameLogic

  include Check
  include GiveHints
  include StartWithComputer

  attr_reader :code
  attr_accessor :attempts

  def initialize
    @attempts = 12
  end

  def start(code)
    #p code
    while self.attempts > 0 do
      self.attempts -=1
      user_attempt = gets.chomp
      give_hints(check(user_attempt), code)
      puts "Осталось попыток: #{self.attempts}"
      if user_attempt == code.join
        puts "Поздравлю вы выиграли!"
        break
      end
    end
    if user_attempt != code.join
      puts "К сожалениию вы не смогли угадать секретный код за 12 попыток!"
    end
    puts "Cекретный код был:#{code}"
  end

end

