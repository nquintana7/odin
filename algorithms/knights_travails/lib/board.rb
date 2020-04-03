module Board
    def self.valid_move?(x, y)
        if x>=0 && x<8 && y>=0 && y<8
            return true
        else
            return false
        end
    end
end
