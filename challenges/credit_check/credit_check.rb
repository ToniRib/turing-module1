class CreditCheck
  def validate_number(card_num)
    arr = break_into_array(card_num)
    doubled = double_every_other_digit(arr)
    single_digits_only = doubled.map do |n|
      double_digits?(n) ? sum_digits(n) : n
    end
    modulo_ten?(sum_elements(single_digits_only))
  end

  def double_every_other_digit(arr)
    reversed = reverse_array(arr)
    odds_doubled = reversed.each_with_index.map do |num, i|
      i.odd? ? num * 2 : num
    end
    reverse_array(odds_doubled)
  end

  def reverse_array(arr)
    arr.reverse
  end

  def double_digits?(num)
    num > 9
  end

  def break_into_array(str)
    str.chars.map { |c| c.to_i }
  end

  def sum_digits(num)
    break_into_array(num.to_s).reduce(:+)
  end

  def sum_elements(arr)
    arr.reduce(:+)
  end

  def modulo_ten?(num)
    num % 10 == 0
  end
end
