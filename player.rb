class Player
  include String_animations

  attr_accessor :turn, :name

  def initialize (name, num)
    @name = name
    @num = num
    if num == 1
      @char = "X"
      @turn = true
    else
      @char = "O"
      @turn = false
    end
  end

  def make_move(board, player_input, enemy)
  
    board.manipulate(player_input, @char)
    @turn = false
    enemy.turn = true
  end 
  
  def trun=(bool)
    @turn = bool 
  end
end