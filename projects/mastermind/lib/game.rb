class Game

  def info
    puts "Чтобы победить вам нужно угадать секретный код компьютера, или компьютеру надо будет угадать ваш секретный код!"
  end

  def start_or_not
    info
    loop do
      puts "Начать новую игру? y/n"
      answer = gets.chomp
      case answer
      when "y"
        play_new_game
      when "n"
        puts "Возвращайтесь скорее!"
        break
      else
        puts "Отвечайте только да или нет пожалуйста!"
      end
    end
  end

  def play_new_game
    puts "Выберите 1 если хотитет отгадывать секретный код, веберите 2 если хотите чтобы компьютер отгадывал секретный код!"
    choose = gets.chomp.to_i
    game_logic = GameLogic.new
    loop do
      if choose == 1
        puts "Компьютер загадал число!"
        new_code = Code.new
        game_logic.start(new_code.secret_code)
        break
      elsif choose == 2
        puts "Загадайте число!"
        code = UserCode.new(gets.chomp)
        code.check_user_code
        game_logic.start_with_computer(code.secret_code)
        break
      else
        puts "Пожалуйста, выберайте только 1 или 2!"
        choose = gets.chomp.to_i
      end
    end
    puts "Игра окончена!"
  end
end
