def merge_sort(array)
    if array.length < 2
        return [array[0]]
    else
        sorted1 = merge_sort(array[0...array.length/2])
        sorted2 = merge_sort(array[array.length/2...array.length])
        array = merge_sorted_arrays(sorted1, sorted2)
    end
    array
end

def merge_sorted_arrays(array1, array2)
    merged_array = []
    array1.each do |value1|
        count = 0
        array2.each_with_index do |value2, index2|
            if value2 < value1
                merged_array << value2
                count = count+1
            end
        end
        for i in 0...count
            array2.shift
        end
        merged_array << value1
    end
    if !array2.empty?
        array2.each{|value| merged_array << value}
    end
    return merged_array
end


#puts merge_sorted_arrays([6], [99,20])

puts merge_sort([4,8,15,6,0,20,99,13,2,1,7,5,11,100,3])
