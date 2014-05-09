class Board
  attr_reader :board

  def initialize            #ask about self methods (why you would use)
    @board = make_board
    populate_board
  end

  def make_board  #currently makes a blank board of nils
    Array.new(8) {Array.new(8)}
  end

  def populate_board  # for initialze only
    @board[0][0] = Rook.new(self, [0,0], "black")
    @board[0][7] = Rook.new(self, [0,7], "black")
    @board[7][0] = Rook.new(self, [7,0], "white")
    @board[7][7] = Rook.new(self, [7,7], "white")

    @board[0][1] = Knight.new(self, [0,1], "black")
    @board[0][6] = Knight.new(self, [0,6], "black")
    @board[7][1] = Knight.new(self, [7,1], "white")
    @board[7][6] = Knight.new(self, [7,6], "white")

    @board[0][2] = Bishop.new(self, [0,2], "black")
    @board[0][5] = Bishop.new(self, [0,5], "black")
    @board[7][2] = Bishop.new(self, [7,2], "white")
    @board[7][5] = Bishop.new(self, [7,5], "white")

    @board[0][3] = Queen.new(self, [0,3], "black")
    @board[7][3] = Queen.new(self, [7,3], "white")

    @board[0][4] = King.new(self, [0,4], "black")
    @board[7][4] = King.new(self, [7,4], "white")

    row = 1
    8.times{ |col| @board[row][col] = Pawn.new(self, [row,col], "black") }
    row = 6
    8.times{ |col| @board[row][col] = Pawn.new(self, [row,col], "white") }
  end

  def render(piece)
    row, col = piece.position[0], piece.position[1]
    @board[row][col] = piece
  end

  def move(from, to)
    piece = @board[from[0]][from[1]]  #represents a Piece object
    piece.update_position(to)
    @board[to[0]][to[1]] = piece
    @board[from[0]][from[1]] = nil
    piece.update_board(@board)

    # method to update piece's board value & position value
  end


  def display
    display_board = make_board    #ask about self methods (why you would use)

    @board.each_with_index do |row, r_idx|
      row.each_with_index do |tile, c_idx|
        if @board[r_idx][c_idx].is_a?(Piece)
          display_board[r_idx][c_idx] = tile.symbol
        elsif @board[r_idx][c_idx].nil?
          display_board[r_idx][c_idx] = "__"
        end
      end
    end

    display_board.each do |row|
      puts
      puts row.join('   ')
    end
    nil
  end

  def in_check?(color)
  end

  # def []()
  #   @board[key] = value
  # end

end


class Piece
  attr_reader :position, :ref_board, :symbol, :color

  def initialize(ref_board, position, color)
    @position = position
    @ref_board = ref_board
    @color = color
  end

  def moves #this will return an array of places the piece can move to
    #go into Subclasses for unique moves
  end

  def update_position(new_position) #this is used by Board object method, move
    @position = new_position
  end

  def update_board(current_board) #this is used by Board object method, move
    @ref_board = current_board
  end

end

class SlidingPiece < Piece
  LINES = [ [0,1], [1,0], [0, -1], [-1, 0] ]
  DIAGONALS = [ [1, 1], [-1, -1], [1, -1], [-1, 1] ]

end

class SteppingPiece < Piece
  KNIGHT_MOVES = [
    [-1, 2], [1, -2], [-1, -2], [1, 2],
    [-2, 1], [2, -1], [-2, -1], [2, 1]
  ]

  KING_MOVES = [
    [0, 1], [1, 0], [0, -1], [-1, 0],
    [1, 1], [-1, -1], [1, -1], [-1, 1]
  ]

end

class King < SteppingPiece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "Ki"
  end

  def possible_moves(current_position)  #returns an array of possible directions
    moves = KING_MOVES.map do |coord|
      [coord[0] + current_position[0], coord[1] + current_position[1]]
    end





    f_moves = moves.select do |x, y|
      [x, y].all? do |coord|
        coord.between?(0, 7)
      end
    end

    f_moves #filtered moves

    neighbors = []

    f_moves.each do |val|
      puts val.color if val.is_a?(Piece)
    end


    # check_neighbors(f_moves) #helper method to filter out bad moves here
  end

  def check_neighbors(moves)

    # moves.select do |x, y|
    #   ((self.ref_board.board[x][y].color != self.color) || (self.ref_board.board[x][y].nil?))

    moves.each do |val|
      x = val[0]
      y = val[1]
      puts self.ref_board[x][y].class
    end



    # moves.select do |x, y|
    #   ((self.ref_board[x][y].color != self.color) || (self.ref_board[x][y].nil?))
    # end

  end

end

class Knight < SteppingPiece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "Kn"
  end

  def possible_moves(current_position)  # returns an array
    moves = KNIGHT_MOVES.map do |x, y|
      [current_position[0] + x, current_position[1] + y]
    end.select do |x, y|
      [x, y].all? do |coord|
        coord.between?(0, 7)
      end
    end
  end

end

class Queen < SlidingPiece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "Q "
  end

  def move_dirs
    #LINES and DIAGONALS
  end

end

class Bishop < SlidingPiece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "B "
  end

  def move_dirs
    #DIAGONALS
  end

end

class Rook < SlidingPiece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "R "
  end

  def move_dirs
    #LINES
  end

end

class Pawn < Piece

  def initialize(ref_board, position, color)
    super(ref_board, position, color)
    @symbol = "P "
  end

end

class Chess
end