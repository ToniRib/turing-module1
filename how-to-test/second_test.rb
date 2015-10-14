require 'minitest'

class ExerciseTest < Minitest::Test
  def test_what_a_random_test
    assert_equal 1, 1
    # this test is included in the same section as test_it_passes
    # when it is run
  end

  def test_it_passes
    assert_equal 45, 50
    # if this test passes, then the test lists only once as passed (since
    # the other one passes). But if this test fails, then it lists the test
    # only as failed.
  end
end
