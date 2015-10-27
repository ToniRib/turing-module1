require 'minitest/autorun'
require 'minitest/pride'
require_relative 'character_count'

class CharacterCountTest < Minitest::Test
  def test_character_count_class_exists
    assert CharacterCount
  end

  def test_returns_nil_if_string_is_empty
    counter = CharacterCount.new

    refute counter.count_chars('')
  end

  def test_counts_one_for_single_character_string
    counter = CharacterCount.new
    expected = {'a' => 1}

    assert_equal expected, counter.count_chars('a')
  end

  def test_counts_one_of_each_letter_for_two_letter_string
    counter = CharacterCount.new
    expected = {'a' => 1, 'b' => 1}

    assert_equal expected, counter.count_chars('ab')
  end

  def test_counts_repeated_characters
    counter = CharacterCount.new
    expected = {'a' => 2, 'b' => 3, 'c' => 4}

    assert_equal expected, counter.count_chars('aabbbcccc')
  end

  def test_counts_spaces
    counter = CharacterCount.new
    expected = { ' ' => 2 }

    assert_equal expected, counter.count_chars('  ')
  end

  def test_counts_capitals_separate_from_lowercase_letters
    counter = CharacterCount.new
    expected = { 'A' => 2, 'a' => 1 }

    assert_equal expected, counter.count_chars('AaA')
  end

  def test_counts_characters_in_full_sentence
    counter = CharacterCount.new
    sentence = 'I really want to work for Wingspan'
    expected = { ' ' => 6,
                 'o' => 3,
                 'r' => 3,
                 'a' => 3,
                 'n' => 3,
                 'w' => 2,
                 'l' => 2,
                 't' => 2,
                 'k' => 1,
                 'W' => 1,
                 'p' => 1,
                 'g' => 1,
                 'i' => 1,
                 'I' => 1,
                 'f' => 1,
                 'y' => 1,
                 's' => 1,
                 'e' => 1
    }

    assert_equal expected, counter.count_chars(sentence)
  end

  def test_sorts_has_based_on_occurences
    counter = CharacterCount.new
    input = { 'a' => 3, 'b' => 6, 'c' => 2, 'd' => 4 }
    expected = { 'b' => 6, 'd' => 4, 'a' => 3, 'c' => 2}

    assert_equal expected, counter.sort(input)
  end
end
