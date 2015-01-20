class Currency
  attr_accessor :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    if self.amount == other.amount && self.code == other.code
      return true
    end
  end

  def +(other)
    if self.code == other.code
      total = self.amount + other.amount
      return Currency.new(total, self.code)
    end
  end

  def -(other)
    if self.code == other.code
      total = self.amount - other.amount
      return Currency.new(total, self.code)
    end
  end

end
