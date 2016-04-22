class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(station)
    add(@current_journey = journey_class.new)
    @current_journey.start(station)
  end

  def finish_journey(station)
    add(@current_journey = journey_class.new) unless @current_journey
    @current_journey.finish(station)
  end

  def journeys
    @journeys.dup
  end

  private
    attr_reader :journey_class, :fare
    
    def add(journey)
      @journeys << journey
    end
end