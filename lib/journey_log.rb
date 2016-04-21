class JourneyLog
  # attr_reader :journeys
  
  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end
  
  def start(station)
    @journeys << @journey_class.new
  end
  
  def finish(station)
    puts "Finish the journey"
    current_journey.finish(station)
  end
  
  def journeys
    p @journeys.dup
  end
  
  private 
    def current_journey
      @journey_class || @journey_class.new
    end
end