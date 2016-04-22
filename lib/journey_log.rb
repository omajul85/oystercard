class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(station)
    raise "Already in journey" if @current_journey
    add(@current_journey = journey_class.new)
    @current_journey.start(station)
  end

  def finish_journey(station)
    add(@current_journey = journey_class.new) unless @current_journey
    dummy = @current_journey.finish(station).dup
    reset
    dummy
  end

  def journeys
    @journeys.dup
  end
  
  def list
    journeys.each { |j| puts "Entry: #{j.entry_station}, Exit: #{j.exit_station}" }
  end

  private
    attr_reader :journey_class, :fare
    
    def add(journey)
      @journeys << journey
    end
    
    def reset
      @current_journey = nil
    end
end