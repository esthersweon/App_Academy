class Board
	attr_reader :board

	def initialize(to_populate = true)
		@board = make_board
		populate_board if to_populate
	end

	def make_board
		Array.new(8) {Array.new(8)}
	end

	def populate_board	
		odds, evens = [1, 3, 5, 7], [0, 2, 4, 6]

		rows = [0, 2]
		rows.each do |row|
			odds.each {|col| @board[row][col] = Piece.new("black", self, [row, col], false)}
		end

		rows = [5, 7]
		rows.each do |row|
			evens.each {|col| @board[row][col] = Piece.new("red", self, [row, col], false)}
		end

		rows = [1, 6]
		rows.each do |row|
			if row == 1
				evens.each {|col| @board[row][col] = Piece.new("black", self, [row, col], false)}
			else
				odds.each {|col| @board[row][col] = Piece.new("red", self, [row, col], false)}
			end
		end

	end

	def [](row, col)
		@board[row][col]
	end

	def []=(row, col, piece)
		@board[row][col] = piece
	end

	def move ([s_row, s_col], [d_row, d_col])

		if @board[d_row][d_col].nil?
			@board[s_row][s_col].position = [d_row, d_col]
			@board[d_row][d_col] = @board[s_row][s_col] 
			@board[s_row][s_col] = nil
		end

		# @board[d_row][d_col].update_board(self)
		
		(@board[d_row][d_col]).maybe_promote

		display
	end

	def perform_slide
		puts "Input starting row:"
		s_row = gets.chomp.to_i
		puts "Input starting column:"
		s_col = gets.chomp.to_i

		puts "Input destination row:"
		d_row = gets.chomp.to_i
		puts "Input destination column:"
		d_col = gets.chomp.to_i

		if self[s_row, s_col].slide_diffs.include?([d_row, d_col])
			@board[s_row][s_col].position = [d_row, d_col]
			@board[d_row][d_col] = @board[s_row][s_col] 
			@board[s_row][s_col] = nil
		end

		@board[d_row][d_col].update_board (self)

		display

		(@board[d_row][d_col]).maybe_promote
	end

	def perform_jump
		puts "Input starting row:"
		s_row = gets.chomp.to_i
		puts "Input starting column:"
		s_col = gets.chomp.to_i

		puts "Input destination row:"
		d_row = gets.chomp.to_i
		puts "Input destination column:"
		d_col = gets.chomp.to_i

		if self[s_row, s_col].jump_diffs.include?([d_row, d_col])
			@board[s_row][s_col].position = [d_row, d_col]
			@board[d_row][d_col] = @board[s_row][s_col] 
			@board[s_row][s_col] = nil
			@board[(s_row + d_row)/2][(s_col + d_col)/2] = nil
			#MUST MAKE JUMPED THING NIL AS WELL
		end

		@board[d_row][d_col].update_board (self)

		display

		(@board[d_row][d_col]).maybe_promote
	end

	def display
		display_board = make_board 
	    @board.each_with_index do |row, r_idx|    #referring to original board
      		row.each_with_index do |tile, c_idx|
        		if @board[r_idx][c_idx].is_a?(Piece)
         			 display_board[r_idx][c_idx] = tile.color[0] + " "
        		elsif @board[r_idx][c_idx].nil?
          			display_board[r_idx][c_idx] = "__"
        		end
        	end
      	end

      	print "\n\n\t"+['0 ','1 ','2 ','3 ','4 ','5 ','6 ','7 '].join('   ')+"\n\n"
    	display_board.each_with_index do |row, idx|
      		print "\n" + idx.to_s + "\t"
      		puts row.join('   ')
    	end
    	puts "\n\n"
    end
end

class Piece
	attr_reader :color, :board
	attr_accessor :position, :king_value

	def initialize(color, board, position, king_value = false)
		@color = color
		@board = board
		@position = position
		@king_value = king_value
	end

	def slide_diffs
		possible_moves = color == "black" ? BLACK_MOVES : RED_MOVES
		possible_moves.map do |coord|
			[coord[0] + self.position[0], coord[1] + self.position[1]]
		end.select do |x, y|
			[x, y].all? do |coord|
				coord.between?(0, 7)
			end
		end.select do |x, y|
			board[x, y].nil?
		end
	end

	def jump_diffs
		possible_jumps = color == "black" ? BLACK_JUMPS : RED_JUMPS
		possible_jumps.map do |coord|
			[coord[0] + self.position[0], coord[1] + self.position[1]]
		end.select do |x, y|
			[x, y].all? do |coord|
          		coord.between?(0, 7)
			end
		end.select do |x, y|
			board[x,y].nil?
		end.select do |x, y|
			jumped = @board.board[(self.position[0] + x)/2][(self.position[1] + y)/2]
			jumped.is_a?(Piece) && jumped.color != self.color
		end
	end

	def update_board (board)
		@board = board
	end

	def maybe_promote
		if (color == "black" && position[0] == 7) || (color == "red" && position[0] == 0)
			@king_value = true
		end
	end

	# def perform_moves!(move_sequence # array of arrays for coordinates)
	# determine whether slide/jump; call appropriate method
	# end

	# def valid_move_seq?
	# begin
    # preform move!
	# rescue
	   # if error return false
	# else
	#  # no error return true
	# end

	# def perform_moves
	# 	valid_move_seq (perform_moves! but with a duped board)
	# 	perform_moves!
	# end

	BLACK_MOVES = [[1, -1], [1, 1]]
	RED_MOVES = [[-1, -1], [-1, 1]]

	BLACK_JUMPS = [[2, -2], [2, 2]]
	RED_JUMPS = [[-2, -2], [-2, 2]]

end











class Game

	b = Board.new
	b.display
	puts

	puts "Input starting row:"
	s_row = gets.chomp.to_i
	puts "Input starting column:"
	s_col = gets.chomp.to_i

	puts "Input destination row:"
	d_row = gets.chomp.to_i
	puts "Input destination column:"
	d_col = gets.chomp.to_i

	b.move([s_row, s_col], [d_row, d_col])



end


