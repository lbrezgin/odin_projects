#Создайте игру Mastermind из командной строки, где у вас есть 12 ходов, чтобы угадать секретный код, начиная с того, что вы угадываете случайный код компьютера.
require_relative "lib/game.rb"
require_relative "lib/code.rb"
require_relative "lib/gamelogic.rb"
require_relative "lib/check.rb"
require_relative "lib/splash_screen.rb"
require_relative "lib/user_code.rb"
require_relative "lib/give_hints.rb"
require_relative "lib/start_With_computer.rb"

splash_screen = SplashScreen.new
puts splash_screen.splash_screen
game = Game.new
game.start_or_not
