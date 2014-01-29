require_relative "words"

# Add to Words
class Words
  def [](i)
    @words[i]
  end

  def length
    @words.length
  end
end

# Add to String, for convenience
class String
  def to_a
    a = []
    self.chars { |c| a+=[c] }
    a
  end

  def shuffle
    self.to_a.shuffle.join
  end
end

# Scramble methods
class Scramble
  def initialize(file)
    @words = Words.new file
    @continue = true
  end

  def correct?(guess)
    @word == guess
  end

  def play
    @i ||= 0
    while @continue
      # Make sure we don't go out of bounds
      unless @words.length > @i
        puts "Out of words!"
        return
      end

      # Start the game
      @word = @words[@i]
      puts "Scrambled word: " + @word.shuffle
      puts
      puts "What's the word?"
      guess = gets.chomp.downcase
      if correct? guess
        puts "That is correct!"
      else
        puts "Sorry, that's not correct."
      end
      @i += 1

      while true
        puts
        puts "Continue? (Y/N)"
        response = gets.chomp.downcase
        if response == 'y'
          break
        elsif response == 'n'
          @continue = false
          break
        end
      end
    end
  end
end

# Allow running as a script
if __FILE__ == $0
  words_file = (ARGV.first || "testWords.txt")
  game = Scramble.new words_file
  ARGV.clear
  game.play
end
