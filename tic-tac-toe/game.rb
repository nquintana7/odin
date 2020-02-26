class Game
    attr_accessor :board
    def initialize
        @board = [ [0,0,0], [0,0,0], [0,0,0] ]
    end
    def play
        puts "Welcome to the TicTacToe game, \nPlease insert the coordinates in the form ixj\nIf you want to stop playing, write EXIT"
        Logic.play(self)
        puts "\nThank you for playing!"
    end
end

class Logic
    def self.play(game)
        stop = false
        turn = 1
        while (!stop)
            empty = false
            puts " "
            game.board.each_with_index do |value,i|
                value.each_with_index do |val, j|
                    if val == 0
                        print "| |"
                        empty = true
                    elsif val == 1
                        print "|x|"
                    elsif val == -1
                        print "|o|"
                    end
                    print "  "
                end
                puts " "
            end
            if check(game.board) == 1
                puts "\nPlayer 1 is the winner"
                break
            elsif check(game.board) == -1
                puts "\nPlayer 2 is the winner"
                break
            end
            if empty == false
                puts "It's a draw!"
                puts "Game ended"
                stop = true
                break
            end  
            if turn == 1
                puts "\nPlayer 1 turn, write the coordinates"
                while !stop
                    coordinates = gets.chomp
                    if valid_input?(coordinates) == 1
                        coordinates = coordinates.split("x")
                        i = Integer(coordinates[0])-1
                        j = Integer(coordinates[1])-1
                        if game.board[i][j] == 0
                        game.board[i][j] = 1
                        turn = 2
                        break
                        end
                        puts "Occupied, try again"
                    elsif valid_input?(coordinates) == -1
                        puts "Try again, Remember insert the coordinates in the form ixj"
                    elsif valid_input?(coordinates) == 0
                        stop = true
                        break
                    end
                end
            elsif turn == 2
                puts "\nPlayer 2 turn, write the coordinates"
                while !stop
                    coordinates = gets.chomp
                    if valid_input?(coordinates) == 1
                        coordinates = coordinates.split("x")
                        i = Integer(coordinates[0])-1
                        j = Integer(coordinates[1])-1
                        if game.board[i][j] == 0
                            game.board[i][j] = -1
                            turn = 1
                            break
                        end
                        puts "Occupied, try again"
                    elsif valid_input?(coordinates) == -1
                        puts "Try again, Remember insert the coordinates in the form ixj"
                    else
                        stop = true
                        break
                    end
                end
            end
        end
    end


  
    def self.check (array)
        che = 0
        che1 = 0
        for i in 0...3
            che = che + array[i][i]
            che1 = che1 + array[2-i][i]
        end
        if che == 3 || che1 == 3
            return 1
        elsif che == -3 || che1 == -3
            return -1
        end
        sumaglobal = 0
        array.each_with_index do |value, i|
            sum = 0
            sum1 = 0
            array.each_with_index do |val, j|
                sum = sum + array[i][j]
                if i == 0
                end
                sum1 = sum1 + array[j][i]
                if i == 0
                end
            end
            if sum == 3 || sum == -3
                sumaglobal = sum
                break
            elsif sum1 == 3 || sum1 == -3
                sumaglobal = sum1
                break
            end
        end
        if sumaglobal == 3
            return 1
        elsif sumaglobal == -3
            return -1
        end
        return 0
    end

    private
    def self.valid_input? (coordinates)
        if coordinates.eql? "EXIT" 
            return 0
        end
        if coordinates.length != 3
            return -1
        end
        if coordinates.count("x") == 1
            coordinates = coordinates.split("x")
            i = Integer(coordinates[0])
            j  = Integer(coordinates[1])
            if i>3 || j>3 || i<1 || j<1
                return -1
            end
            return 1
        else
            return -1
        end
    end
end

Game.new.play