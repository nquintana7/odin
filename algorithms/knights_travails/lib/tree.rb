require './lib/node'
require './lib/knight'

class Tree
    include Knight
    attr_reader :root, :path, :best_depth, :runtime

    def initialize(start_position, end_position)
        @path = []
        @root = breadth_build_dynamically(Node.new(start_position), end_position)
    end

    ## build tree dynamically thru breadth-first algorithm
    private def breadth_build_dynamically(node, final_position)
        yet_to_visit = []
        actual = node
        yet_to_visit << actual
        found = false
        depth = 0
        while true
            if actual.position == final_position 
                create_path(actual)
                break
            end
            depth = depth + 1
            children = Knight.possible_moves(actual.position)
            children.each do |val|
                node = Node.new(val, actual)
                actual.children << node
                yet_to_visit << node
            end
            yet_to_visit.delete(actual)
            actual = yet_to_visit[0]
        end
    end

    def create_path(node)
        while true
            @path << node
            unless node.father.nil?
                node = node.father
            else
                break
            end
        end
    end


    ## build tree dynamically thru depth-first algorithm
    private def depth_build_dynamically(node, final_position, visited, depth=0) 
        unless @best_depth.nil? 
            if depth > @best_depth
                return 0
            end
        end
        visited << node
        if node.position == final_position
            if @best_depth.nil?
                @best_depth = depth
                @path = visited
                return 0
            end
            if  @best_depth > depth
                @best_depth = depth
                @path.clear
                @path = visited
                return 0 
            else
                return 0
            end
        end
        visited = visited.dup
        children = Knight.possible_moves(node.position)
        children.each do |value|
            child = Node.new(value)
            unless visited.include?(child)
                node.children << child
                tru = depth_build_dynamically(child, final_position, visited, depth+1)
                if tru.is_a? Integer
                    break
                end
                visited.delete(child)
            end
        end
        return node
    end
end
