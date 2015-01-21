require './currency'

class CurrencyConverter
  attr_accessor :hash
  def initialize(hash)
    @hash = hash
  end

  def convert(currency, code_new)
    if currency.code == code_new
      return currency #Currency.new(currency.amount, currency.code)
    else
      num_total = currency.amount * hash[code_new] / hash[currency.code]
      return Currency.new(num_total, code_new)
    end
  end




end
