require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
  def test_currency_class_exists
    assert Currency
  end

  def test_truth
    assert true
  end

  def test_currency_has_two_parameters
    assert Currency.new(100, "USD")
  end

  def test_currency_equal_to_object
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "USD")
    canad_currency = Currency.new(100, "CAN")
    assert usa_currency == usa2_currency
    refute canad_currency == usa_currency
  end

  def test_currency_can_be_added
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "USD")
    result = usa_currency.+(usa2_currency)
    assert_equal 200, result.amount
  end

   def test_currency_can_be_subracted

   end

  #
  # def test_currency_gets_an_error
  #
  # end
  #
  # def test_currency_can_be_multiplied
  #
  # end





end
