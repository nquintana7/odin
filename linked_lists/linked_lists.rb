class LinkedList
    def initialize
        @head = nil
        @tail = nil
    end
    def append(value)
        if @head.nil?
            @head = Node.new(value)
        elsif @tail.nil?
            @tail = Node.new(value)
            @head.next_to = @tail
        else
            new_node = Node.new(value)
            @tail.next_to = new_node
            @tail = new_node
        end
    end
    def prepend(value)
        if @head.nil?
            @head = Node.new(value)
        elsif @tail.nil?
            @tail = Node.new(value)
            @head.next_to = @tail
        else
            new_node = Node.new(value)
            new_node.next_to = @head
            @head = new_node
        end
    end
    def size
        count = 0
        actual = @head
        while true
            if actual.nil?
                break
            end
            count = count + 1
            actual = actual.next_to
        end
        return count
    end
    def head
        @head
    end
    def tail
        @tail
    end
    def pop
        actual = @head
        if @head.nil?
            return 0
        end
        if actual.next_to.nil?
            @head = nil
            return 0
        end
        while true
            if actual.next_to == @tail
                break
            else
                actual = actual.next_to
            end
        end
        actual.next_to = nil
        @tail = actual
    end
    def to_s
        actual = @head
        while (true)
            if actual.nil?
                print "nil"
                break
            end
            print "( #{actual.value} ) -> "
            actual = actual.next_to
        end
    end
    def at(index)
        if !@head.nil?
            count = 0
            actual = @head
            while true
                if count == index
                    return actual
                    break
                end
                count = count+1
                actual = actual.next_to
            end
        end
    end
    def contains?(value)
            actual = @head
            while true
                if actual.nil?
                    return false
                end
                if actual.value == value
                    return true
                    break
                end
                actual = actual.next_to
            end
        return false
    end
end

class Node
    attr_accessor :value, :next_to
    def initialize(value=nil, next_to=nil)
        @value = value
        @next_to = next_to
    end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.prepend("HOLA")
list.prepend("SAPE")
list.append(5)

puts list.contains?(5)
