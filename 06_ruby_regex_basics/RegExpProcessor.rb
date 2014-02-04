class RegExpProcessor
  def self.is_float string
    /\d*\.\d+/ =~ string
  end

  def self.is_date string
    /^(0?[1-9]|1[0-2])[\/-](0?[1-9]|[1-2][0-9]|3[01])[\/-]([12][0-9]{3}|[0-9]{2})$/ =~ string
  end

  def self.is_complex string
    /[+-]?\d*[+-]?\d+i/ =~ string
  end
end
