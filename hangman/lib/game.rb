require "csv"

module Launcher
    def start
        puts "Do you want a NEW game or LOAD last save?"
        puts "Write NEW or LOAD"
        print"> "
        while user_input = gets.chomp # loop while getting user input
          case user_input
            when "NEW"
                play(Game.new(get_word, 13))
                break
            when "LOAD"
                load_game
                break
            else
                puts "Please select either NEW or LOAD"
                print "> " 
            end
        end
    end

    private def play(game)
        while true
            if game.guesses_left <= 0
                puts "You lost"
                break 
            elsif game.won?
                puts "You won, the word was #{game.secret_word.join("")}"
            end
            puts game.actual
            if !game.incorrect_letters.empty?
                puts "Incorrect words: #{game.incorrect_letters.join(", ")}"
            end
            print game.secret_word.join("")
            puts "\nType a letter, you have #{game.guesses_left} guesses left. Type 'SAVE' for saving the game"
            while true
                input = gets.chomp.upcase
                if input.length == 1
                    break
                elsif input == "SAVE"
                    save_game(game)
                    break
                else
                    puts "Type only a word please"
                end
            end
            game.play_guess(input)
        end
    end

    private def save_game(game)
        CSV.open("save.csv", "wb") do |csv|
            csv << ["secret_word", "guesses_left", "actual", "incorrect_letters"]
            csv << [game.secret_word.join(","), game.guesses_left, game.actual.join(","),game.incorrect_letters.join(",")]
        end
        exit
    end

    private def get_word
        words = []
        IO.foreach("words.txt"){ |word|
            word = word.strip
            if word.length >= 5 && word.length <= 12
                words << word
            end
        }
        words.sample.upcase.chars
    end

    private def load_game
        game = Game.new("ol", 3)
        file = CSV.read("save.csv")[1]
        secret_word = file[0].split(",")
        guesses_left = file[1].to_i
        actual = file[2].split(",")
        incorrect_letters = file[3].split(",")
        game = game.load_state(secret_word, guesses_left, actual, incorrect_letters)
        play(game)
    end
end

class Game
    attr_reader :secret_word
    attr_reader :guesses_left
    attr_reader :actual
    attr_reader :incorrect_letters

    def initialize(secret_word, guesses)
        @secret_word = secret_word
        @guesses_left = guesses
        @incorrect_letters = []
        @actual = Array.new(@secret_word.length)
        @actual.map!{|val| 
            "_"
        }
    end

    def load_state(secret_word, guesses_left, actual, incorrect_letters)
        @secret_word = secret_word
        @guesses_left = guesses_left
        @incorrect_letters = incorrect_letters
        @actual = actual
        self
    end

    def play_guess(letter)
        hit = false
        @secret_word.each_with_index do |let, index|
            if let[0] == letter[0]
                hit = true
                @actual[index] = letter
            end
        end
        if !hit
            @incorrect_letters << letter
        end
        @guesses_left = @guesses_left - 1
    end

    def won?
        if @secret_word == @actual
            return true
        else 
            return false
        end
    end

end

include Launcher

Launcher.start