class Node
    attr_accessor :position, :children, :father
    def initialize(position, father=nil)
        if position.length > 2
            puts "INVALID INPUT, Default position setted to 0,0"
            @position = [0,0]
            @children = []
        else
            @position = position
            @children = []
            @father = father
        end
    end

    def ==(other)
        self.position == other.position
    end
end
