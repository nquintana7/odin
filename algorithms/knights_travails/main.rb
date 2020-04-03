require "./lib/tree"

def get_input
    while true
        input = gets.chomp
        check = check_input(input)
        if check
            break
        end
        puts "Wrong input, please try again"
    end
    return check
end

def check_input(input)
    position = input.split(",")
    position.map!{|value| 
        value.to_i
    }
    if position.length == 2 && position[0] >= 0 && position[0] < 8 && position[1] >= 0 && position[1] <8
        return position
    else
        return false
    end
end

def knight_moves(start,ende)
    tree = Tree.new(start, ende)
    tree.path.reverse!
    tree.path
end

puts "Write the start and end position please"
puts "You should write the first two coordinates first like 'x,y' only with numbers from 0 to 7"
input1 = get_input
puts "Now please write the coordinates from end position"
input2 = get_input
path = knight_moves(input1, input2)
puts "You made it in #{path.length-1} moves! The path was:"
    path.each{|node|
        puts "#{node.position[0]}, #{node.position[1]}"
    }




