# require 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :journeys, :journey_log

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station, journey_log)
    message = "Cannot touch in: balance must be at least #{journey::MINIMUM_FARE}"
    raise message if balance < journey::MINIMUM_FARE
    @journey_log = journey_log.new
    @journey_log.start_journey(station)
  end

  def touch_out(station)
    @journeys << @journey.finish_journey(station)
    deduct(@journey.fare) ######
  end

  private

    def deduct(amount)
      @balance -= amount
    end
end
