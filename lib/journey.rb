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
    return PENALTY_FEE unless completed?
    if entry_station.zone == exit_station.zone
      MINIMUM_FARE
    else
      (entry_station.zone - exit_station.zone).abs
    end
  end

  def completed?
    !!(entry_station && exit_station)
  end
end