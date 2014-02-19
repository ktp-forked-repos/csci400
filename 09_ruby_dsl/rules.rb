require_relative "product_rules"

# Method definitions
def product(text)
  Rules.instance.add_product Product.new(text)
end

def packing_slip(text)
  Rules.instance.last_product.add_action Action.new 'packing_slip', text
  Product.instance_eval { def packing_slip text; puts "---- Packing slip for #{text}"; end }
end

def activate
  Rules.instance.last_product.add_action Action.new 'activate'
  Product.instance_eval { def activate; puts "---- Activating membership"; end }
end

def email(text)
  Rules.instance.last_product.add_action Action.new 'email', text
  Product.instance_eval { def email text; puts "---- Emailing #{text}"; end }
end

def pay(text)
  Rules.instance.last_product.add_action Action.new 'pay', text
  Product.instance_eval { def pay text; puts "---- Paying #{text}"; end }
end

def include_free(text)
  Rules.instance.last_product.add_action Action.new 'include_free', text
  Product.instance_eval { def include_free text; puts "---- Including a free #{text}"; end }
end

def notify(text)
  Rules.instance.last_product.add_action Action.new 'notify', text
  Product.instance_eval { def notify text; puts "---- Notifying #{text}"; end }
end

def fill_warranty_card
  Rules.instance.last_product.add_action Action.new 'fill_warranty_card'
  Product.instance_eval { def fill_warranty_card; puts "---- Filling warranty card"; end }
end

if __FILE__ == $0
  # Load rules
  begin
    if ARGV.first
      Rules.instance.load_rules ARGV.first
      ARGV.clear
    else
      Rules.instance.load_rules 'businessRules.txt'
    end
  rescue NoMethodError, NameError
    puts "Please contact tech support for more assistance"
    exit
  end

  # Begin program
  Rules.instance.run_rules
end
