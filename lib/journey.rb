class Journey
  MINIMUM_FARE = 1
  PENALTY_FEE = 6
  
  attr_reader :entry_station, :exit_station, :complete
  
  def initialize(station)
    @entry_station = station
    @complete = false
  end
  
  def finish(station)
    @exit_station = station
    @complete = true
    self
  end
  
  def fare
    completed? ? MINIMUM_FARE : PENALTY_FEE
  end
  
  def completed?
    complete
  end
end