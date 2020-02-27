class Player
    def choose_pattern(str)
        str = str.upcase
        str = str.gsub(/\s+/, "")
        str_array = str.split(",")
        str_array.each_with_index{|value, index| str_array[index] = Color.new(value)}
        str_array
    end
end

class Color
    attr_reader :name
    def initialize (name)
        @name = name
    end
    def eql?(other)
        other.instance_of?(self.class) && @name == other.name
    end
    def ==(other)
        self.eql?(other)
    end
    def to_s
        @name
    end
end

class MasterMindGame
    def run
        code_maker = Player.new
        code_breaker = Player.new
        started = false
        turn = 1
        @board = Board.new
        while(true)
            if !started
                while true
                puts "CODEMAKER: Choose the code set be to deciphered (Possible colors are: RED, BLUE, ORANGE, YELLOW, GREEN, PURPLE)"
                pattern = code_maker.choose_pattern(gets.strip)
                    if valid_input?(pattern)
                        break
                    end
                end
                puts " "
             ##   pattern = []
             ##   for i in 0...4
             ##       pattern << @board.colors_ingame.sample
             ##   end
                started = true
                @board.set_pattern(pattern)
            end
            if  started
                if turn > 1
                    @board.display
                end
                while true
                    puts "CODEBREAKER, your turn #{turn} (Possible colors are: RED, BLUE, ORANGE, YELLOW, GREEN, PURPLE)"
                    guess = code_breaker.choose_pattern(gets.chomp)
                        if valid_input?(guess)
                            break
                        end
                end
                check_guess(guess)
                @board.fill(guess)
                yo = won?(guess)
                if yo
                    puts "Codebreaker wins!"
                    break
                elsif turn == 12
                    puts "Codemaker wins! You tried already 12 times!"
                end
                turn = turn + 1
            end
            puts " "
        end
    end

    private
    def check_guess(guess)
        not_repeat_black = []
        not_repeat_white = []
        code = @board.array_codemaker 
        guess.each_with_index do |value,index|
            if code.include?value
                    if value == code[index]
                    @board.array_help << @board.colors_help[0]
                    not_repeat_black << value
                    else 
                        if !not_repeat_white.include?value
                            if !not_repeat_black.include?value
                            not_repeat_white << value
                            @board.array_help << @board.colors_help[1]
                            end
                        end
                    end
            end
        end
    end

    private
    def won?(guess)
        won = true
        guess.each_with_index do |value, index|
            if value != @board.array_codemaker[index]
                won = false
            end
        end
        won
    end
    
    private
    def valid_input?(guess)
        arr = guess
        if arr.length != 4
            return false
        end
        arr.each{|value| 
            if !@board.colors_ingame.include?value
                return false
            end
        }
        true
    end
end

class Board
    attr_accessor :array_grid
    attr_accessor :array_help
    attr_reader :array_codemaker
    attr_reader :colors_ingame
    attr_reader :colors_help

    def initialize
        @array_grid = []
        @array_help = []
        @array_codemaker = []
        @colors_ingame = [Color.new("RED"),Color.new("BLUE"),Color.new("ORANGE"),Color.new("YELLOW"), Color.new("GREEN"), Color.new("PURPLE")]
        @colors_help = [Color.new("BLACK"), Color.new("WHITE")]
    end

    def set_pattern(pattern)
        @array_codemaker = pattern
    end

    def display
        @array_grid.each{|value| value.each do |val| 
        print val 
        print "  " 
        end
        }
        print "[ "
        @array_help = @array_help.shuffle
        @array_help.each_with_index{|value,index|
            print value
            if index != @array_help.length-1
            print", " 
            end
        }
        print " ]"
        puts " "
        puts " "
        @array_help.clear
        @array_grid.clear
    end

    def fill(array)
        @array_grid << array
    end
end


game = MasterMindGame.new()

game.run


