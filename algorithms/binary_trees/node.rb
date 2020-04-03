class Node
    attr_accessor :data, :left_children, :right_children
    def initialize(data, left=nil, right=nil)
        @data = data
        @left_children = left
        @right_children = right
    end

    def ==(other)
        self.data == other.data
    end
end

