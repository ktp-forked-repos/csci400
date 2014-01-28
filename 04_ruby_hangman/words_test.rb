require "test/unit"
require_relative "words"

class TestWords < Test::Unit::TestCase
  def setup
    @words = Words.new "testWords.txt"
  end

  def test_load_words
    assert(["apple", "banana", "grapefruit", "kiwi"] == @words.words)
  end

  def test_random_select
    results = Hash.new(0)
    (0..99).each do |i|
      results[@words.random.to_sym] += 1
    end
    assert(results[:apple] > 10)
    assert(results[:banana] > 10)
    assert(results[:grapefruit] > 10)
    assert(results[:kiwi] > 10)
  end
end
