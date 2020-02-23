def bubble_sort(arr)
    swapped_global = true
    while (swapped_global)
    swapped_global = false
    arr.each_with_index{|value, index|
        if index+1 < arr.length
            if arr[index+1] < value
            arr[index] = arr[index+1]
            arr[index+1] = value
            swapped_global = true
            end
        end
    }
    end
    arr
end
###########################
def bubble_sort_by(array)
    swapped_global = true
    while (swapped_global)
    swapped_global = false
        array.each_with_index{|value,index|
            if(index+1 < array.length)
                difference = yield(array[index], array[index+1])
                if difference > 0
                    array[index] = array[index+1]
                    array[index+1] = value
                    swapped_global = true
                end
            end      
        }
    end
    puts array
end

bubble_sort_by(["hiwwwwwwwwwwwwwwwwwwwwwww","hellewgewgwo","hey","acdefeegew","hey","hey","hey","hey","sapeeee"]) do |left,right|
    left.length - right.length
end
