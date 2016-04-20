class Journey
  MINIMUM_FARE = 1
  PENALTY_FEE = 6
  
  attr_reader :entry_station, :exit_station, :ticket
  
  def start(station)
    @entry_station = station
  end
  
  def finish(station)
    @exit_station = station
    @ticket = { entry_station: @entry_station, exit_station: @exit_station }
  end
  
  def fare
    # complete?
    complete? ? MINIMUM_FARE : PENALTY_FEE
  end
  
  def in_journey?
    !!@entry_station
  end
  
  def complete?
    !!(@entry_station && @exit_station)
  end
  
end