require_relative "words"

class Hangman
  BAD_MAX = 6

  def initialize(file = "testWords.txt")
    @file = file
  end

  def prompt
    puts
    while true
      print "Enter 'q' to quit or any other character for another game: "
      if gets.chomp.downcase == 'q'
        exit
      else
        play
      end
    end
  end

  def play
    word = (Words.new @file).random
    bad = 0
    bad_guesses = String.new
    split_word = Array.new
    word.chars { |c| split_word += ["_ "] }
    while bad < BAD_MAX
      unless split_word.include? "_ "
        # No underscores left
        puts "Congratulations, you win!"
        prompt
      end
      puts "THE WORD"
      if bad > 0
        puts "Bad guesses (only " + (BAD_MAX - bad).to_s + " left!): " + bad_guesses
      end
      puts split_word.join
      puts
      print "Enter your next letter or '0' to guess the answer: "
      guess = gets.chomp.downcase
      if guess == '0'
        # Handle guesses
        puts "What's the word?"
        if word == gets.chomp.downcase
          puts "That is correct, you win!"
          prompt
        else
          puts "That is not correct, you lose!"
          prompt
        end
      elsif word.include? guess[0]
        # Update the displayed word
        index = word.index guess[0]
        while index
          split_word[index] = word[index] + ' '
          last_index = index
          index = word[index+1..word.length].index guess[0]
          index &&= last_index + index + 1
        end
      else
        # Update the bad guesses
        bad += 1
        bad_guesses += guess[0]
      end
    end
    puts "Sorry, too many bad guesses!"
    prompt
  end
end

if __FILE__ == $0
  words_file = ARGV.first
  if words_file == nil
    game = Hangman.new
  else
    game = Hangman.new words_file
  end
  ARGV.clear
  game.play
end
