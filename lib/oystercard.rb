class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    message = "Cannot touch in: balance must be at least #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
  end
  
  def in_journey?
    !!@entry_station
  end
  
  private
  
    def deduct(amount)
      @balance -= amount
    end
end
