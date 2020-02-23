################ EXERCISE 2: Stock Picker
def stock_picker(arr)
    num1 = 0
    num2 = 0
    max = 0
    arr.each_with_index{|value, index|
    for i in index...arr.length
        if i != 0
            resta = arr[i]-value
            if (resta > max)
                num1 = index
                num2 = i
                max = resta
            end
        end
    end
    }
    [num1,num2]
end
