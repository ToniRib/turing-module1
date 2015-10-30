class Person
  attr_reader :name
  attr_accessor :galleons, :accounts

  def initialize(name, galleons = 0)
    @name = name
    @galleons = galleons
    @accounts = {}
    puts "#{@name} has been created with #{@galleons} galleons in cash."
  end

  def add_account(bank_name)
    @accounts[bank_name] = 0
    puts "An account has been opened for #{name} with #{bank_name}."
  end

end
