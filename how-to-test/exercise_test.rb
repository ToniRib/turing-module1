require 'minitest/autorun'
require 'minitest/pride'

class ExerciseTest < Minitest::Test
  def test_it_passes
    assert_equal 10, 10
  end

  def test_it_skips
    skip
  end

  def helper_method
    1
  end

  def test_helper_method_1
    assert_equal 1, helper_method
    # passes
  end

  def test_helper_method_2
    assert_equal 2, helper_method
    # fails
  end

  def test_way_too_many_times
    10000.times { assert_equal 1, 1 }
    # passes and is only listed as one example
  end

  def test_assert_then_skip_pass
    assert_equal true, true
    # the whole test is still skipped even though there is an assert_equal here
    skip
  end

  def test_skip_then_assert_pass
    skip
    assert_equal true, true
    # whole test still skipped again
  end

  def test_assert_then_skip_fail
    assert_equal true, false
    # THIS FAILS!
    skip
  end

  def test_skip_then_assert_fail
    skip
    assert_equal true, false
    # whole test skipped again
  end

  def test_it_fails
    assert_equal true, false
  end

  def test_it_errors
    assert_equal true, bananas
  end

  def non_test_method
    assert_equal true, true
    # doens't recognize this as a test/assertion
  end

  def test_double_fail
    assert_equal 1, 2
    # only the first one fails
    assert_equal 3, 4
  end

  def test_double_assertion
    assert_equal true, true
    assert_equal 3, 3
    # only thinks there is one example
  end
end

# tests with the same method names: last test will 'win out'
# so if the first tests passes but the second test fails then
# the whole example fails

class OtherTest < Minitest::Test
  def test_it_is_awesome
    assert_equal 5, 5
    # this also runs even though it is in a different class
  end
end

class NonTestClass
  def test_or_no_test
    assert_equal 8, 8
    # doesn't recognize this as a test/assertion
  end
end
