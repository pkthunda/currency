require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './different_currency_code_error'
require './currency_converter'

class CurrencyTest < Minitest::Test
  def test_00_currency_class_exists
    assert Currency
  end

  def test_01_truth
    assert true
  end

  def test_02_currency_has_two_parameters
    assert Currency.new(100, "USD")
  end

  def test_03_currency_equal_to_object
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "USD")
    canad_currency = Currency.new(100, "CAN")
    assert usa_currency == usa2_currency
    refute canad_currency == usa_currency
  end

  def test_04_currency_can_be_added
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "USD")
    result = usa_currency.+(usa2_currency)
    assert_equal 200, result.amount
  end

   def test_05_currency_can_be_subracted
     usa_currency = Currency.new(100, "USD")
     usa2_currency = Currency.new(99, "USD")
     result = usa_currency.-(usa2_currency)
     assert_equal 1, result.amount
   end

  def test_06_currency_gets_an_error
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "EURO")
    assert_raises DifferentCurrencyCodeError do
      usa_currency + usa2_currency
    end
    assert_raises DifferentCurrencyCodeError do
      usa_currency - usa2_currency
    end
  end

  def test_07_currency_can_be_multiplied
    usa_currency = Currency.new(100, "USD")
    assert usa_currency * 9 == Currency.new(900, "USD")
    assert usa_currency * 2.5 == Currency.new(250, "USD")
  end

  def test_08_currency_converter_exists
    assert CurrencyConverter
  end

  def test_09_currency_converter_hash
    assert CurrencyConverter.new({USD: 1.0, EUR: 0.86})
  end

  def test_10_converter_return_equal_code
    currency_converter = CurrencyConverter.new({USD: 1.0, EUR: 0.86})
    assert currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD)
  end

  def test_11_converter_currency_different_code
    currency_converter = CurrencyConverter.new({USD: 1.0, EUR: 0.86})
    assert_equal currency_converter.convert(Currency.new(1, :USD), :EUR), Currency.new(0.86, :EUR)
  end

  def test_12_converter_currency_three_codes_and_rates
    currency_converter = CurrencyConverter.new({USD: 1, EUR: 0.86, RUB: 65.28})
    assert_in_delta 65.28, currency_converter.convert(Currency.new(1, :USD), :RUB).amount, 0.05
    assert_in_delta 75.95, currency_converter.convert(Currency.new(1, :EUR), :RUB).amount, 0.05
  end






end
