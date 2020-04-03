 def fibs(n)
    sequence = []
    for i in 0..n
        if i == 0
            sequence << i
        elsif i == 1
            sequence << i
        else
            sequence << sequence[i-1]+sequence[i-2]
        end
    end
    sequence
end

def fibs_rec(n)
    sequence = []

    if n == 0
    elsif n == 1
        sequence = [0,1]
    else
        sequence = fibs_rec(n-1)
        sequence << sequence[-1] + sequence[-2]
    end
end

puts fibs(14)
puts "----------------"
puts fibs_rec(14)
