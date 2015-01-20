require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
  def test_truth
    assert true
  end

  def test_currency_has_two_parameters
    assert currency_type("", "")
  end

  def test_currency_equal_to_object
    assert_equal currency_type("", "").class, Array
  end


end
