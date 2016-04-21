class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(station)
    @current_journey = journey_class.new
    @current_journey.start(station)
    @fare = @current_journey.fare
  end

  def finish_journey(station)
    @current_journey ||= @journey_class.new
    @journeys << @current_journey.finish(station)
    @fare = @current_journey.fare
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  def get_fare
    @fare
  end

  private
    attr_reader :journey_class, :fare

end