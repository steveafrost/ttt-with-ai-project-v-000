class Player::Computer < Player
  
  attr_accessor :board, :token, :win_move, :at_play
  
  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
  ]
  
  def turn_count
    # binding.pry
    actual_turn_count = board.cells.count {|token| token == "X" || token == "O"}
    actual_turn_count += 1
  end
  
  def move(board)
    board_available_moves = []
    @board = board
    board.cells.each.with_index(1) do |value, index|
      board_available_moves << index if value == " "
    end
    puts "Turn #{turn_count}"
    if turn_count < 4
      board_available_moves.sample
    elsif turn_count >= 4
      win_rule ?  win_rule : board_available_moves.sample
    end
    

    # if board.turn_count < 4
    #   puts "turn count less than 4"
    #   board_available_moves.sample
    # elsif board.turn_count == 4
    #   puts "turn count is 4, returning car alarms"
    #   @at_play = open_shot
    #   take_the_shot
    # else
    #   puts "random move"
    #   board_available_moves.sample
    # end
  end

  def win_rule
    # => position on board

    # => detect if board has 2 tokens in a row and 
    # place the third token of winning combination
    # => what is two in a row?
    # matching any two of the winning combo
    
    WIN_COMBINATIONS.detect do |combination|
      win_combo0 = @board.cells[combination[0]]
      win_combo1 = @board.cells[combination[1]]
      win_combo2 = @board.cells[combination[2]]
      if win_combo0 == win_combo1
        puts "win_combo0 == win_combo1"
        @win_move = combination[2]
        puts "win_move: #{@win_move}"
      elsif win_combo1 == win_combo2
        puts "win_combo1 == win_combo2"
        @win_move = combination[0]
        puts "win_move: #{@win_move}"
      elsif win_combo0 == win_combo2
        puts "win_combo0 == win_combo2"
        @win_move = combination[1]
        puts "win_move: #{@win_move}"
      else
        puts "no match found"
      end
    end
  end

  # def open_shot
    
  #   WIN_COMBINATIONS.detect do |combination|
      
  #     # HAS TO BE AN X OR O IF IT"S NOT EMPTY
  #     (@board.cells[combination[0]] != " " && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[2]] == " ") ||
      
  #     #index 1 is not X or O and 0 is open; take 0
  #     (@board.cells[combination[1]] != " " && @board.cells[combination[1]] == @board.cells[combination[2]] && @board.cells[combination[0]] == " ") ||
      
  #     #index 2 is not X or O and 1 is open; take 1
  #     (@board.cells[combination[2]] != " " && @board.cells[combination[2]] == @board.cells[combination[0]] && @board.cells[combination[1]] == " ")
  #   end
  #   # binding.pry
  # end
  
  # def take_the_shot
  #   @at_play.each.with_index do |value, index|
  #     if @board.cells[value] == " "
  #       @score = index
  #     end
  #   end
  #   @score
  # end
      
    
    
    
  
  # def block_rule
  #   @spots_we_tried = []
  #   # rand(1..9)
  #   
  #   # => detect if opponent has 2 in a row and place the third of winning combination
  #   # => what is two in a row?
  #   # matching any two of the winning combo
  #   
  #   
  #   WIN_COMBINATIONS.detect do |combination|
  #     win_combo0 = @board.cells.cells[combination[0]]
  #     win_combo1 = @board.cells.cells[combination[1]]
  #     win_combo2 = @board.cells.cells[combination[2]]
  #     
  #     if win_combo0 == win_combo1
  #       puts "win_combo0 == win_combo1"
  #       @best_spot = combination[2]
  #     elsif win_combo1 == win_combo2
  #       puts "win_combo1 == win_combo2"
  #       @best_spot = combination[0]
  #     elsif win_combo0 == win_combo2
  #       puts "win_combo0 == win_combo2"
  #       @best_spot = combination[1]
  #     else
  #       puts "no match found"
  #     end
  #   end
  #   block_rule if @spots_we_tried.include?(@best_spot)
  #   @spots_we_tried << @best_spot
  # 
  #   @best_spot
  # end
  
end