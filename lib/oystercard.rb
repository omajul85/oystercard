class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :journey_log

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station, journey_log)
    message = "Cannot touch in: balance must be at least #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    @journey_log = journey_log.new(Journey)
    @journey_log.start_journey(station)
  end

  def touch_out(station)
    aux_journey = @journey_log.finish_journey(station)
    deduct(aux_journey.fare)
  end

  private

    def deduct(amount)
      @balance -= amount
    end
end
