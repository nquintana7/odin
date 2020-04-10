class Calculator
    def add(*numbers)
       sum = 0
       numbers.each{|val| sum = sum + val}
       sum
    end

    def multiply(*numbers)
        result = 1
        numbers.each{|val| result = result*val}
        result
    end

    def subtract(*numbers)
        result = 0
        numbers.each_with_index{|val, ind| 
            if ind == 0
                result = val
            else
                result = result - val
            end
        }
        result
    end
end