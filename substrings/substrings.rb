#################### EXERCISE 3: Substrings
def substrings(str, arr)
    result = Hash.new
    str = str.split(" ")
    str.each{|st|
        for i in 0...st.length
            act_str = st.to_s
            for z in 1..st.length-i
            actstr = act_str[i, z]
            arr.each_with_index{|val, index|
                if actstr.casecmp(val) == 0
                    if result[val].nil?
                        result[val] = 1
                    else
                        result[val] = result[val] + 1  
                    end
                end
            }
            end
        end

    }
    result
end