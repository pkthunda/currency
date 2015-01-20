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
    usa_currency = Currency.new(100, "USD")
  end

  def test_currency_equal_to_object
    usa_currency = Currency.new(100, "USD")
    usa2_currency = Currency.new(100, "USD")
  end

  # def test_currency_can_be_added
  #
  # end
  #
  # def test_currency_can_be_subracted
  #
  # end
  #
  # def test_currency_gets_an_error
  #
  # end
  #
  # def test_currency_can_be_multiplied
  #
  # end





end
