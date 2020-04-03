require './node'

class Tree
    attr_accessor :root
    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
        array = array.uniq.sort
        while true
            if array.length <= 1
                return Node.new(array[0])
            end
        if array.length == 2
            root = Node.new(array[0])
            root.right_children = Node.new(array[1])
            return root
        end
            left = array[0, array.length/2]
            right = array[(array.length/2)+1..array.length]
            root = Node.new(array[array.length/2])
            root.left_children = build_tree(left)
            root.right_children = build_tree(right)
            break
        end
        root
    end

    def insert(value)
        root = @root
        while true
            if value > root.data
                if root.right_children.nil?
                    root.right_children = Node.new(value)
                    break
                end
                root = root.right_children
            elsif value < root.data
                if root.left_children.nil?
                    root.left_children = Node.new(value)
                    break
                end
                root = root.left_children
            elsif value == root.data
                puts "Tree already contains the value #{value}"
                break
            end
        end
    end

    def delete(value)
        root = @root
        prev = root
        while true
            if value > root.data
                if root.right_children.nil?
                    puts "Value does not exist in Tree"
                    return 0
                    break
                end
                prev = root
                root = root.right_children
            elsif value < root.data
                if root.left_children.nil?
                    puts "Value does not exist in Tree"
                    return 0
                    break
                end
                prev = root
                root = root.left_children
            elsif value == root.data
                if root.right_children.nil? && root.left_children.nil?
                    if prev.right_children == root
                        prev.right_children = nil
                        root = nil
                    elsif prev.left_children == root
                        prev.left_children = nil
                        root = nil
                    end
                   break
                elsif root.right_children.nil? && !root.left_children.nil?
                    if prev.right_children == root
                        prev.right_children = root.left_children
                        root = nil
                    elsif prev.left_children == root
                        prev.left_children = root.left_children
                        root = nil
                    end
                    break
                elsif !root.right_children.nil? && root.left_children.nil?
                    if prev.right_children == root
                        prev.right_children = root.right_children
                        root = nil
                    elsif prev.left_children == root
                        prev.left_children = root.right_children
                        root = nil
                    end
                    break
                else
                    if prev.right_children == root
                        original = root
                        root = root.left_children
                        root.right_children = original.right_children
                        prev.right_children = root
                        original = nil
                    elsif prev.left_children == root
                        original = root
                        root = root.left_children
                        root.right_children = original.right_children
                        prev.left_children = root
                        original = nil
                    end
                    break
                end
            end
        end
    end

    def find(value)
        root = @root
        while true
            if value > root.data
                if root.right_children.nil?
                    puts "Value does not exist in Tree"
                    return 0
                    break
                end
                root = root.right_children
            elsif value < root.data
                if root.left_children.nil?
                    puts "Value does not exist in Tree"
                    return 0
                    break
                end
                root = root.left_children
            elsif value == root.data
                return root
            end
        end
    end

    def level_order
        if block_given?
            yet_to_visit = []  
            yet_to_visit << @root 
            while true
                copy = yet_to_visit.dup
                copy.each do |value|
                    yield(value)
                    yet_to_visit.delete(value)
                    if !value.left_children.nil?
                        yet_to_visit << value.left_children
                    end
                    if !value.right_children.nil?
                        yet_to_visit << value.right_children
                    end
                end
                if yet_to_visit.empty?
                    break
                end
            end
        else
            return []
        end
    end

    def preorder(arg=nil, &block)
        if block_given?
            if arg.nil?
                arg = @root
            end
            yield(arg)
            if !arg.left_children.nil?
                preorder(arg.left_children, &block)
            end
            if !arg.right_children.nil?
                preorder(arg.right_children, &block)
            end
        else
            return []
        end
    end

    def depth(node, count=0)
        if node.left_children.nil? && node.right_children.nil?
            return count
        end
        count = count + 1
        if !node.right_children.nil? || !node.left_children.nil?
            count1 = 0
            count2 = 0
            if !node.right_children.nil?
                count1 = depth(node.right_children, count)
            end
            if !node.left_children.nil?
                count2 = depth(node.left_children, count)
            end
        end
        if count1 >= count2
            count = count1
        else
            count = count2
        end
        return count
    end

    def balanced?
        unless @root.left_children.nil? && @root.right_children.nil?
            left_height = depth(@root.left_children)
            right_height = depth(@root.right_children)
            if left_height-right_height > 1 || left_height-right_height < -1
                return false
            else
                return true
            end
        end
    end

    def rebalance!
        array = []
        self.level_order{|value| array << value.data}
        @root = build_tree(array)
    end

end