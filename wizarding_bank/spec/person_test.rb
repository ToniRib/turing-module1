require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class PersonTest < Minitest::Test
  def test_person_has_a_name
    person = Person.new("Miranda")

    assert_equal "Miranda", person.name
  end

  def test_person_has_money
    person = Person.new("Harry", 1000)

    assert_equal 1000, person.galleons
  end

  def test_person_associates_galleons_with_specific_account
    person = Person.new("Harry", 1000)
    person.add_account("JP Morgan Chase")

    expected = { "JP Morgan Chase" => 0 }

    assert_equal expected, person.accounts
  end
end
