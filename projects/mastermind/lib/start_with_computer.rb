require_relative "give_hints.rb"

module StartWithComputer

  include GiveHints

  def start_with_computer(code)

    while self.attempts > 0 do
      self.attempts -= 1
      guess_code = []

      4.times do
        guess_code.push(rand(8))
      end

      if guess_code == code
        puts "Компьютер угадал!"
        break
      end

      p guess_code
      give_hints(guess_code.join, code)
      puts "Осталось #{self.attempts} попыток!"
      sleep(1)
    end

    puts "Компьютер не смог разгодать ваш секретный код!" if guess_code != code
    puts "Cекретный код был:#{code}"
  end
end
