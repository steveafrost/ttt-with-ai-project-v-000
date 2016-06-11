class Player::Computer < Player
  
  attr_accessor :board, :token, :win_move, :board_available_moves, :potential_win_combo
  
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
    actual_turn_count += 1 # => account for turn 0 with 0 tokens
    actual_turn_count
  end
  
  def move(board)
    @board_available_moves = []
    @board = board

    board.cells.each.with_index(1) do |value, index|
      @board_available_moves << index if value == " "
    end
    puts "Turn #{turn_count}"
    win_or_block(self.token)
    # @board_available_moves.sample

  end

    # if board.turn_count < 4
    #   puts "turn count less than 4"
    #   @board_available_moves.sample
    # elsif board.turn_count == 4
    #   puts "turn count is #{board.turn_count}, win_rule in effect."
    #   win_rule
    # elsif board.turn_count > 4
    #   puts "turn count is #{board.turn_count}, win_rule in effect."
    #   win_rule
    # else
    #   puts "something broken, random move"
    #   board_available_moves.sample
    # end

  def win_or_block(token)

    # => detect if board has 2 tokens in a row and 
    # place the third token of winning combination
    # => what is two in a row?
    # matching any two of the winning combo
    scan_board_player_tokens = []
    board.cells.each.with_index(1) do |value, index|
      scan_board_player_tokens << index if value == token
    end
    "puts #{scan_board_player_tokens}"
    @potential_win_combo = []
    WIN_COMBINATIONS.each do |combo|
     @potential_win_combo << combo if @board_available_moves.include?(combo)
    end
    binding.pry
  end

end

    # WIN_COMBINATIONS.detect do |combo|
    #   win_combo0 = @board.cells[combo[0]] 
    #   win_combo1 = @board.cells[combo[1]]
    #   win_combo2 = @board.cells[combo[2]]