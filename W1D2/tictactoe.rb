class Board
    attr_accessor :pos, :mark
    
    def initialize(@pos, @mark)
        @pos = pos
        @mark = mark
        @tiles = Array.new(3){Array.new(3)}
    end
    
    def won?
        
        if any row, column, diagonal has 3 marks
        end
        
        def winner
        end
        
        def empty?(pos)
        end
        
        def place_mark(pos, mark)
        end
        
    end
    
    
    
    
    class Game
        
        def play
        end
        
    end
    
    class HumanPlayer
    end
    
    class ComputerPlayer
    end
