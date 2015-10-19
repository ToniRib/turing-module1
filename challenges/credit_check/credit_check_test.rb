require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCheckTest < Minitest::Test
  def test_doubles_every_other_digit
    checker = CreditCheck.new
    original = [1, 2, 3, 4]
    doubled = [2, 2, 6, 4]
    assert_equal doubled, checker.double_every_other_digit(original)
  end

  def test_can_reverse_an_array
    checker = CreditCheck.new
    assert_equal [3, 2, 1], checker.reverse_array([1, 2, 3])
  end

  def test_returns_true_if_number_is_greater_than_9
    checker = CreditCheck.new
    assert checker.double_digits?(11)
  end

  def test_returns_false_if_number_is_less_than_9
    checker = CreditCheck.new
    refute checker.double_digits?(8)
  end

  def test_returns_false_if_number_is_equal_to_9
    checker = CreditCheck.new
    refute checker.double_digits?(9)
  end

  def test_breaks_string_into_array_of_integers
    checker = CreditCheck.new
    assert_equal [4, 3, 2, 5, 6], checker.break_into_array('43256')
  end

  def test_sums_digits_of_a_number
    checker = CreditCheck.new
    assert_equal 8, checker.sum_digits(17)
  end

  def test_sums_elements_of_array
    checker = CreditCheck.new
    arr = [1, 2, 3, 4, 5]
    assert_equal 15, checker.sum_elements(arr)
  end

  def test_returns_true_if_modulo_10_is_zero
    checker = CreditCheck.new
    assert checker.modulo_ten?(70)
  end

  def test_returns_false_if_modulo_10_is_not_zero
    checker = CreditCheck.new
    refute checker.modulo_ten?(68)
  end

  def test_validates_valid_card_number
    checker = CreditCheck.new
    card_number = '5541808923795240'
    assert checker.validate_number(card_number)
  end

  def test_rejects_invalid_card_number
    checker = CreditCheck.new
    card_number = '5541801923795240'
    refute checker.validate_number(card_number)
  end
end
