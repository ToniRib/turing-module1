require 'pry'

class Bank
  attr_reader :name
  attr_accessor :vault

  def initialize(name, vault = 0)
    @name = name
    @vault = vault
    puts "#{name} has been created."
  end

  def total_cash
    vault
  end

  def open_account(person)
    person.add_account(name)
  end

  def deposit(person, amount)
    fail "#{person.name} does not have enough cash to perform this deposit." if amount > person.galleons

    @vault += amount
    person.galleons -= amount
    person.accounts[name] += amount

    puts "#{amount} galleons have been deposited into #{person.name}'s #{name} account. Balance: #{person.accounts[name]} Cash: #{person.galleons}"
  end

  def withdrawal(person, amount)
    fail "Insufficient funds." if amount > person.accounts[name]

    @vault -= amount
    person.galleons += amount
    person.accounts[name] -= amount

    puts "#{person.name} has withdrawn #{amount} galleons. Balance: #{person.accounts[name]}"
  end

  def transfer(person, bank, amount)
    fail "Insufficient funds." if amount > person.accounts[name]

    fail "#{person.name} does not have an account with #{bank.name}." unless person.accounts.keys.include?(bank.name)

    @vault -= amount
    person.accounts[name] -= amount
    bank.vault += amount
    person.accounts[bank.name] += amount

    puts "#{person.name} has transferred #{amount} galleons from #{name} to #{bank.name}."

  end

end
