class Journey
  MINIMUM_FARE = 1
  PENALTY_FEE = 6
  
  attr_reader :entry_station, :exit_station
  
  def start(station)
    @entry_station = station
  end
  
  def finish(station)
    @exit_station = station
    self
  end
  
  def fare
    completed? ? MINIMUM_FARE : PENALTY_FEE
  end
  
  def in_journey?
    !!@entry_station
  end
  
  def completed?
    !!(entry_station && exit_station)
  end
  
end