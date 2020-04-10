module Enumerable
    def my_each
        for i in 0...self.length
            yield(self[i])
        end
        return self
    end

    def my_each_with_index
        for i in 0...self.length
            yield(self[i], i)
        end
        return self
    end



    def my_map(proc=nil)
        if !proc.nil?
            for i in 0...self.length
                self.my_each_with_index{|value, index| self[index] = proc.call(value)}
            end
        return self
        elsif block_given?
                self.my_each_with_index{|value, index| self[index] = yield(value)}
        return self
        end
    end


    def my_all?
        unless self.length == 0
            bool = true
            for i in 0...self.length
                if !yield(self[i])
                bool = false
                end
            end
        return bool
        else
        return true
        end
        
    end

    def my_any?
        unless self.length == 0
            bool = false
            self.my_each do |value|
                if block_given? && yield(value)
                    bool = true 
                elsif !block_given? && value
                    bool = true
                end
            end
            return bool
        else 
        return false
        end
    end

    def my_none?
        unless self.length == 0
            bool = true
            self.my_each do |value|
                if block_given? && yield(value)
                    bool = false
                elsif !block_given? && value
                    bool = false
                end
            end
            return bool
        else 
        return true
        end
    end

    def my_inject
        temp = 1
        self.my_each{|value| temp = yield(temp, value)}
        return temp
    end
end

