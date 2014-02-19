require "test/unit"
require_relative "product_rules"
require_relative "rules"

class BusinessRulesTest < Test::Unit::TestCase

  def test_load_rules
    Rules.instance.load_rules 'businessRules.txt'
    assert_equal 5, Rules.instance.products.length
    assert_equal 3, Rules.instance.products[:book].actions.length
    assert_equal 2, Rules.instance.products[:membership].actions.length
    assert_equal 1, Rules.instance.products[:"ski helmet"].actions.length
  end

  def test_load_fails
    assert_raise(NoMethodError) {
      Rules.instance.load_rules 'badRules.txt'
    }
  end
end
