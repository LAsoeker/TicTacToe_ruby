require './modules.rb'
require './player.rb'
require './board.rb'

class TicTacToe

  include String_animations

  def initialize()
    puts File.read('/Users/maximiliansoeker/odin-project/ruby/projects/TicTacToe_ruby/tictactoe.txt')
    puts "\n\n\n\n"
    animate_text "\t\tHello, Welcome to TicTacToe!\n\n\t\tPlayer 1 please enter your name: "
    @player1 = Player.new(gets.chomp, 1)
    puts "\n"
    animate_text "\t\tPlayer 2 please enter your name: "
    @player2 = Player.new(gets.chomp, 2)
    puts "\n"
    @board = Board.new()
    @winner = false 
  end

  def play
    loop do
      @board.display
      until check_winner || check_draw
        play_round
      end 
      display_outcome
      break if restart_game?
    end
  end

  private

  def restart_game?
    animate_text "\t\tWant to play again?(Y/any key to exit) "
    if gets.chomp == 'Y'
      @board.reset
      @winner = false
      animate_text "\t\tLoser begins"
      return false
    else
      return true
    end
  end

  def check_winner
    @board.WINNING_CONSTILATIONS.each do |arr| 
      if arr.uniq.size<=1 
        return true
      end
    end
    return false
  end

  def check_draw
    if @board.state.none?(Numeric) && check_winner
      return false
    elsif @board.state.none?(Numeric) && !check_winner
      return true
    end
  end

  def display_outcome
    if check_draw
      animate_text "\n\t\tDRAW!\n\n"
    else
      @player1.turn ? @winner = @player2 : @winner = @player1
      animate_text "\n\t\t#{@winner.name} wins the game!\n\n"
    end
  end

  def play_round
    player_input = 0
    animate_text "\t\t#{@player1.turn ? @player1.name : @player2.name} it's your turn.\n"
    until player_input.between?(1,9)
      animate_text "\t\tPick a number between 1 and 9: "
      player_input = gets.chomp
      if player_input == 'exit'
        exit
      end
      player_input = player_input.to_i
    end
    if @board.legalmove?(player_input)
      @player1.turn ? @player1.make_move(@board,  player_input, @player2) : @player2.make_move(@board,  player_input, @player1)
    else
      animate_text "\t\tOnly free fields!\n"
      return
    end
  end
end

game = TicTacToe.new()
game.play
