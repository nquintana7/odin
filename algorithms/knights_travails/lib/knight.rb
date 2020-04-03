require './lib/board'

module Knight
    include Board
    def self.possible_moves(start_position)
        x = start_position[0]
        y = start_position[1]
        possible_moves = []
        if Board.valid_move?(x+2,y+1)
            possible_moves << [x+2,y+1]
        end
        if Board.valid_move?(x+2,y-1)
            possible_moves << [x+2, y-1]
        end
        if Board.valid_move?(x-2,y+1)
            possible_moves << [x-2, y+1]
        end
        if Board.valid_move?(x-2,y-1)
            possible_moves << [x-2,y-1]
        end
        if Board.valid_move?(x-1, y+2)
            possible_moves << [x-1,y+2]
        end
        if Board.valid_move?(x+1,y+2)
            possible_moves << [x+1, y+2]
        end
        if Board.valid_move?(x-1, y-2)
            possible_moves << [x-1, y-2]
        end
        if Board.valid_move?(x+1, y-2)
            possible_moves << [x+1, y-2]
        end
        return possible_moves
    end
end
