class BankAccount

  attr_accessor :currency

  def initialize(money)
    @currency = money
  end

  def <=>(other)
    self.currency <=> other.currency
  end
end
  a = BankAccount.new(100)
  b = BankAccount.new(200)
  puts b > a
