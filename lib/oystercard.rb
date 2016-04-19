class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    message = "Cannot touch in: balance must be at least #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
  end
  
  def in_journey?
    !!@entry_station
  end
  
  private
  
    def deduct(amount)
      @balance -= amount
    end
end
