class Oystercard
  MAXIMUM_BALANCE = 90
  
  attr_reader :balance, :journeys, :journey

  def initialize(journey)
    @balance = 0
    @journey = journey
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    message = "Cannot touch in: balance must be at least #{@journey.class::MINIMUM_FARE}"
    raise message if balance < @journey.class::MINIMUM_FARE
    @journey.start(station)
  end

  def touch_out(station)
    @journeys << @journey.finish(station)
    deduct(@journey.fare)
  end
  
  private
  
    def deduct(amount)
      @balance -= amount
    end
end
