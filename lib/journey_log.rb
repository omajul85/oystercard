class JourneyLog
  
  def initialize(journey_class)
    @journey_class = journey_class.new
    @journeys = []
  end
  
  def start_journey(station)
    @journey_class.start(station)
  end
  
  def finish_journey(station)
    @journeys << current_journey.finish(station)
  end
  
  def journeys
    @journeys.dup
  end
  
  private 
    def current_journey
      @journey_class || @journey_class.new
    end
end