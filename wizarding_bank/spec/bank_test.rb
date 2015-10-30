require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test
  def test_bank_has_a_name
    chase = Bank.new("JP Morgan Chase")

    assert_equal "JP Morgan Chase", chase.name
  end

  def test_person_can_open_an_account
    chase = Bank.new("JP Morgan Chase")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)

    expected = { "JP Morgan Chase" => 0 }

    assert_equal expected, neville.accounts
  end

  def test_person_can_open_two_different_accounts
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)
    tcf.open_account(neville)

    expected = { "JP Morgan Chase" => 0,
                 "Twin Cities Federal" => 0 }

    assert_equal expected, neville.accounts
  end

  def test_bank_initializes_with_zero_money
    chase = Bank.new("JP Morgan Chase")

    assert_equal 0, chase.vault
  end

  def test_person_can_depost_into_bank_vault
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Harry", 1000)

    chase.open_account(person)
    chase.deposit(person, 100)

    assert_equal 100, chase.vault
    assert_equal 900, person.galleons
  end

  def test_deposit_goes_to_the_correct_account
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)

    chase.open_account(neville)
    tcf.open_account(neville)

    expected = { "JP Morgan Chase" => 0,
                 "Twin Cities Federal" => 0 }

    assert_equal expected, neville.accounts

    chase.deposit(neville, 100)
    tcf.deposit(neville, 300)

    expected = { "JP Morgan Chase" => 100,
                 "Twin Cities Federal" => 300 }

    assert_equal expected, neville.accounts
  end

  def test_person_cannot_deposit_more_than_their_galleons
    chase = Bank.new("JP Morgan Chase")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)

    fail_message = 'Neville does not have enough cash to perform this deposit.'

    e = assert_raises(RuntimeError) { chase.deposit(neville, 1000) }
    assert_equal fail_message, e.message
  end

  def test_person_can_withdraw_from_a_bank
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Harry", 1000)

    chase.open_account(person)
    chase.deposit(person, 100)

    chase.withdrawal(person, 50)

    assert_equal 50, chase.vault
    assert_equal 950, person.galleons
  end

  def test_withdrawal_comes_from_the_correct_account
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)

    chase.open_account(neville)
    tcf.open_account(neville)

    chase.deposit(neville, 100)
    tcf.deposit(neville, 300)

    chase.withdrawal(neville, 50)
    tcf.withdrawal(neville, 200)

    expected = { "JP Morgan Chase" => 50,
                 "Twin Cities Federal" => 100 }

    assert_equal expected, neville.accounts
  end

  def test_person_cannot_withdrawal_more_than_their_account
    chase = Bank.new("JP Morgan Chase")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)

    chase.deposit(neville, 100)

    fail_message = 'Insufficient funds.'

    e = assert_raises(RuntimeError) { chase.withdrawal(neville, 1000) }
    assert_equal fail_message, e.message
  end

  def test_person_can_transfer_money_between_accounts
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)

    chase.open_account(neville)
    tcf.open_account(neville)

    chase.deposit(neville, 100)
    tcf.deposit(neville, 300)

    chase.transfer(neville, tcf, 50)

    expected = { "JP Morgan Chase" => 50,
                 "Twin Cities Federal" => 350 }

    assert_equal expected, neville.accounts
  end

  def test_person_cannot_transfer_more_than_their_account
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)
    tcf.open_account(neville)

    chase.deposit(neville, 100)

    fail_message = 'Insufficient funds.'

    e = assert_raises(RuntimeError) { chase.transfer(neville, tcf, 1000) }
    assert_equal fail_message, e.message
  end

  def test_person_cannot_transfer_to_bank_with_no_account
    chase = Bank.new("JP Morgan Chase")
    tcf = Bank.new("Twin Cities Federal")
    neville = Person.new("Neville", 500)
    chase.open_account(neville)

    chase.deposit(neville, 100)

    fail_message = 'Neville does not have an account with Twin Cities Federal.'

    e = assert_raises(RuntimeError) { chase.transfer(neville, tcf, 50) }
    assert_equal fail_message, e.message
  end

  def test_banks_can_call_their_vault_amount
    chase = Bank.new("Chase")
    person1 = Person.new("Neville", 500)
    person2 = Person.new("Minerva", 500)
    chase.open_account(person1)
    chase.open_account(person2)

    chase.deposit(person1, 100)
    chase.deposit(person2, 150)

    assert_equal 250, chase.total_cash
  end


end
