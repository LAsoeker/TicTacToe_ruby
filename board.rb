class Board
  attr_accessor :WINNING_CONSTILATIONS, :state

  def initialize()
    @state = Array.new(9) {|n| n+1}
    @WINNING_CONSTILATIONS = [
      [@state[0], @state[1], @state[2]],
      [@state[0], @state[4], @state[8]],
      [@state[0], @state[3], @state[6]], 
      [@state[1], @state[4], @state[7]],  
      [@state[2], @state[5], @state[8]],  
      [@state[3], @state[4], @state[5]],  
      [@state[6], @state[7], @state[8]],  
      [@state[2], @state[4], @state[6]]
    ]
  end

  def display
    puts "\n\n\t\t\t #{@state[0]} | #{@state[1]} | #{@state[2]} "
    puts "\t\t\t---+---+---"
    puts "\t\t\t #{@state[3]} | #{@state[4]} | #{@state[5]} "
    puts "\t\t\t---+---+---"
    puts "\t\t\t #{@state[6]} | #{@state[7]} | #{@state[8]}\n\n"
  end

  def manipulate(input, char)
      @state[input-1] = char
      update_winning_contilations
      display
  end

  def update_winning_contilations
    @WINNING_CONSTILATIONS = [
      [@state[0], @state[1], @state[2]],
      [@state[0], @state[4], @state[8]],
      [@state[0], @state[3], @state[6]], 
      [@state[1], @state[4], @state[7]],  
      [@state[2], @state[5], @state[8]],  
      [@state[3], @state[4], @state[5]],  
      [@state[6], @state[7], @state[8]],  
      [@state[2], @state[4], @state[6]]
    ]
  end

  def legalmove?(input)
    @state[input - 1].is_a?(Numeric)
  end

  def reset
    @state = Array.new(9) {|n| n+1}
    @WINNING_CONSTILATIONS = [
      [@state[0], @state[1], @state[2]],
      [@state[0], @state[4], @state[8]],
      [@state[0], @state[3], @state[6]], 
      [@state[1], @state[4], @state[7]],  
      [@state[2], @state[5], @state[8]],  
      [@state[3], @state[4], @state[5]],  
      [@state[6], @state[7], @state[8]],  
      [@state[2], @state[4], @state[6]]
    ]
  end
end

