class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    message = "Cannot touch in: balance must be at least #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
  
  def in_journey?
    @in_journey
  end
end
