class Currency
  attr_accessor :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(currency)
    if self.amount == currency.amount && self.code == currency.code
      return true
    end
  end




end
