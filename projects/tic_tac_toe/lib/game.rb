class Game
  attr_reader :player_1, :player_2, :new_field, :x_arr, :o_arr

  def initialize
    @player_1 = MyPlayer::Player.new("X")
    @player_2 = MyPlayer::Player.new("O")
    @new_field = Field.new
    @validaty = ("1".."9").to_a
    @delete_validaty = []
    @x_arr = []
    @o_arr = []
  end

  def rules
    puts "Добро пожаловать в игру! Первый из вас выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает!"
    puts new_field.field
  end

  def move(player)
    puts "Игрок #{player.role} делает свой ход!"

    number = gets.chomp
    @delete_validaty.each do |pair|
      while pair.include?(number) do
        puts "Эта позиция уже занята!"
        number = gets.chomp
      end
    end

    returned = self.new_field.move_on_field(number, player.role)
    @delete_validaty << [@validaty.delete(returned), player.role]
  end

  def result_array
    @delete_validaty.each do |par|
      if par[1] == "X"
        self.x_arr.push(par)
      elsif par[1] == "O"
        self.o_arr.push(par)
      end
    end
  end

  def win_combination(win_array)
    result_array

    array_with_results = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["1", "4", "7"],
    ["2", "5", "8"],
    ["3", "6", "9"],
    ["1", "5", "9"],
    ["3", "5", "7"]
    ]

    check_win = []

    win_array.each do |pair|
      check_win << (pair[0])
    end

    result = true
    array_with_results.each do |par|
      if (par - check_win).empty?
        result = false
      end
    end
    result
  end


  def game_progress
    move(self.player_1)
    move(self.player_2) unless @validaty.empty? || !win_combination(self.x_arr)
  end

  def start
    while win_combination(self.o_arr) && win_combination(self.x_arr) && !@validaty.empty? do
      game_progress
    end

    if win_combination(self.x_arr) == false
      puts "X победил!"
    elsif win_combination(self.o_arr) == false
      puts "О победил!"
    else
      puts "Ничья!"
    end
  end
end


