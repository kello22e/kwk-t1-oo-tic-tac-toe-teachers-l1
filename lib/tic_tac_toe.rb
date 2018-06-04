class TicTacToe
  #initialize
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]
    
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  #current player method
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  #turn count method
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
 #position_taken method
 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end
  
 # code your #valid_move? method here
 def valid_move?(index)
   if index.between?(0,8)
    if !(position_taken?(index))
      TRUE
    else
      FALSE
    end
  end
end

#input_to_index method
def input_to_index(input)
  index = input.to_i - 1
  return index
 # move(index,player)
end

#move method
def move(index, player)
  @board[index] = player
end

#turn method
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
  else
    turn
  end
  display_board
end

 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   
   def won?
     board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
    end
  end
  
  #full method
  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end
  
  
  #draw method
 def draw?
   !won? && full? ? true : false
  end
 
  #over method
  def over?
    won? || draw? || full? ? true : false
  end

  #winner method
  def winner
    if won?
      win_combination = won?
      if @board[win_combination[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
end