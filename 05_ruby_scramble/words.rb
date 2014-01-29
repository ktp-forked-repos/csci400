class Words
  def initialize(file)
    @file = file
    load_words
  end

  def load_words
    @words = open(@file).read().split(' ')
  end

  def random
    # Array#sample works only in Ruby 1.9.1+
    #@words.sample
    @words[rand(@words.length)]
  end

  def words
    @words
  end
end
