class Player
    def choose_pattern(str)
        str = str.upcase
        str = str.gsub(/\s+/, "")
        str_array = str.split(",")
        str_array.each_with_index{|value, index| str_array[index] = Color.new(value)}
        str_array
    end
end

class Computer
    attr_accessor :final_code
    attr_accessor :s
    attr_reader :all_scores

    def initialize(board)
        @final_code = []
        @@tries = 0
        @guess = []
        @board = board
        @s = @board.colors_ingame.repeated_permutation(4).to_a
        @copy_s = @s.dup
        @all = [Color.new("BLACK"), Color.new("BLACK"), Color.new("WHITE"), Color.new("WHITE")]
        @all_scores = []
        @all_scores << get_right_array(@all.repeated_combination(4).to_a)
        @all_scores << get_right_array(@all.repeated_combination(3).to_a)
        @all_scores << get_right_array(@all.repeated_combination(2).to_a)
        @all_scores << get_right_array(@all.repeated_combination(1).to_a)
    end

    def get_right_array(array)
        array.each_with_index{|value, index|       
            array.each_with_index{|val, ind|
                if ind != index
                    if value.sort_by{|obj| obj.id} == val.sort_by{|obj| obj.id}
                    array.delete_at(ind)
                    end
                end
            }  
        }
        array
    end

    def make_guess(colors_ingame)
        @guess.clear
        for i in 0...4
            if final_code[i]
                @guess[i] = final_code[i]
            else
                @guess[i] = colors_ingame.sample
            end
        end
        return @guess
    end

   # def guess
   #     copy_s = fir_guess
   #     if copy_s == true
   #         return 1
    #    end
   #     next_guess(copy_s)
  #  end
    def calculate
        guess1 = [Color.new("RED"), Color.new("RED"), Color.new("BLUE"), Color.new("BLUE")]
        puts @board.array_codemaker
        while true
            if (MasterMindGame.won?(guess1) == true)
                break
            end
            @@tries = @@tries + 1
            guess(guess1)
            puts "Try number #{@@tries}"
           # bol.each {|val|
           #     print "#{val[0]}, #{val[1]}, #{val[2]}, #{val[3]} "
           #     puts " "
           # }
           guess1 = score?
        end
        puts "The code was:"
        puts guess1
        puts "Took: #{@@tries} guesses"
    end

    def score?
        best_score = 0
        the_chosen_ones = []
        the_chosen_ones.clear
        if @copy_s.length == 1
            return @copy_s[0]
        end
        @s.each_with_index do |value, index|
            best_local = 0
            @copy_s.each_with_index do |copyvalue, copyindex|
                how_many = 0
                @all_scores.each do |pegsa|
                    pegsa.each_with_index do |pegs, an| 
                                sorted_hin = MasterMindGame.feedback(copyvalue, value).sort_by{|val| val.id}
                                sorted_guess_hin = pegs.sort_by{|val| val.id}
                                if sorted_hin != sorted_guess_hin || sorted_guess_hin.length != sorted_hin.length
                                    how_many = how_many + 1
                                end
                                if best_local < how_many
                                    best_local = how_many
                                end
                    end
                end
            end
            score = @copy_s.length - best_local
            if score > best_score
                the_chosen_ones.clear
                best_score = score
                the_chosen_ones << value
            elsif score == best_score
                the_chosen_ones << value
            end
        end
        sape = 0
        the_chosen_ones.each{|value|
            if @copy_s.include?value
                sape = value
                break
            else
                sape = value
            end
        }
        puts sape
        return sape
end

    def guess(guess)
        hinweis = MasterMindGame.feedback(guess, @board.array_codemaker).sort_by{|val| val.id}.dup
        puts hinweis
        sape = @copy_s.dup
        sape.each do |value|
            sorted_guess_hin = MasterMindGame.feedback(value, guess).sort_by{|val| val.id}.dup
            if hinweis != sorted_guess_hin || hinweis.length != sorted_guess_hin.length
                ind = @copy_s.index(value)
                @copy_s.delete_at(ind)
            end
        end
        @copy_s
    end

 #   def delete_others(guess)
#     sape = @copy_s.dup
  #     hinweis = MasterMindGame.feedback(guess, @board.array_codemaker).dup
  #      sape.each_with_index do |value|
  #         
  #
  #  end

    def all_black?(hinweis)
        bol = true
        hinweis.each { |value|
            if value != Color.new("BLACK")
                bol = false
            end
        }
        return bol
    end
end

class Color
    attr_reader :name
    attr_reader :id
    @@created = 0
    @@name_to_id = Hash.new

    def initialize (name)
        @name = name
        if @@name_to_id.key?(@name)
            @id = @@name_to_id[@name]
        else
            @id = @@created + 1
            @@created = @@created + 1
            @@name_to_id[@name] = @id
        end
    end

    def eql?(other)
        other.instance_of?(self.class) && @id == other.id
    end

    def ==(other)
        self.eql?(other)
    end

    def to_s
        @name
    end
end

module MasterMindGame
    def self.run
        puts "Welcome to the MasterMindGame, \nWrite 1 for you to guess the computer secret colors\nWrite 2 for the computer to guess your secret color"
        begin
            mode = gets.chomp[0].match(/[1-2]/)[0]
        rescue
            puts "Invalid response, try again."
            retry
        end
        if mode == 1.to_s
            mode_player_codebreaker
        elsif mode == 2.to_s
            mode_computer_codebreaker
        end
    end

    private
    def self.mode_computer_codebreaker
        @@board = Board.new
        @@board.set_pattern([Color.new("ORANGE"),Color.new("BLUE"),Color.new("PURPLE"),Color.new("GREEN")])
        comp = Computer.new(@@board)
        comp.calculate
            

       # comp.createS([1,2,3,4,5,6])
      ##  turn = 1
      ##  started = false
      ##  @@board = Board.new
      ##  code_maker = Player.new
      ##  computer = Computer.new
      #  while (true)
      #      if !started
       #         puts "Choose your secret colors"
       #         begin
      #              pattern = code_maker.choose_pattern(gets.chomp)
      #              valid_input?(pattern)
       #         rescue
        #            puts "Invalid response, try again."
       #             retry
       #         end
       #         started = true
        #        @@board.set_pattern(pattern)
         #   end
          #  break
           # if started
        ##        guess = computer.make_guess(@@board.colors_ingame)
        #        react(guess)
        #        turn = turn + 1
        #    end
        # end
        
    end

    private
    def self.mode_player_codebreaker
        turn = 1
        started = false
        @@board = Board.new
        code_breaker = Player.new
        while(true)
            if !started
                while true
                pattern = []
                for i in 0...4
                    pattern << @@board.colors_ingame.sample
                end
                started = true
                @@board.set_pattern(pattern)
                break
                end
            end
            if  started
                if turn > 1
                    @@board.display
                end
                while true
                    puts "CODEBREAKER, your turn #{turn} (Possible colors are: RED, BLUE, ORANGE, YELLOW, GREEN, PURPLE)"
                    guess = code_breaker.choose_pattern(gets.chomp)
                        if valid_input?(guess)
                            break
                        end
                end
                feedback(guess)
                @@board.fill(guess)
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

    def self.feedback(guess, pattern)
        code = pattern.dup
        array = []
        guess.each_with_index do |value,index|
            if code.include?value
                    if value == code[index]
                        array << @@board.colors_help[0]
                        code[index] = 0
                    else 
                        array << @@board.colors_help[1]
                    end
            end
        end
       array
    end

    private
    def self.won?(guess)
        won = true
        guess.each_with_index do |value, index|
            if value != @@board.array_codemaker[index]
                won = false
            end
        end
        won
    end
    
    private
    def self.valid_input?(guess)
        arr = guess
        if arr.length != 4
            return false
        end
        arr.each{|value| 
            if !@@board.colors_ingame.include?value
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


MasterMindGame.run


