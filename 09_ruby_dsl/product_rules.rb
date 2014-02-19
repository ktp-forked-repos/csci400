require 'singleton'

class Rules
  include Singleton
  attr_reader :products, :last_product

  def initialize
    @products = {}
  end

  def add_product(product)
    @products[product.name] ||= product
    @last_product = @products[product.name]
  end

  def load_rules file
    begin
      load file
    rescue NoMethodError, NameError => e
      puts "Action in rules file is not defined: #{e.name}."
      puts "Aborting..."
      puts
      raise e
    end
  end

  def run_rules
    while true
      puts
      print "Enter product type or 'quit' to end: "
      product = gets.chomp.to_sym
      puts
      if product == :quit then
        return
      elsif @products.include? product
        puts "Processing order for a: #{product}"
        @products[product].actions.each do |action|
          if action.text then
            Product.send action.name, action.text
          else
            Product.send action.name
          end
        end
      else
        puts "Undefined product: #{product}"
      end
    end
  end
end

class Product
  attr_reader :name, :actions

  def initialize name
    @name = name.to_sym
    @actions = []
  end

  def add_action(action)
    @actions << action
  end

  def to_s
    @name
  end
end

class Action
  attr_reader :name, :text
  def initialize name, text = nil
    @name = name
    @text = text
  end
end
