class Currency
  attr_accessor :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    self.amount == other.amount && self.code == other.code
  end

  def +(other)
    if self.code == other.code
      total = self.amount + other.amount
      return Currency.new(total, self.code)
    else
      raise DifferentCurrencyCodeError, "No, no, no."
    end
  end

  def -(other)
    if self.code == other.code
      total = self.amount - other.amount
      return Currency.new(total, self.code)
    else
      raise DifferentCurrencyCodeError, "You can't do this"
    end
  end

  def *(num)
    Currency.new(self.amount * num, code)
  end



end
