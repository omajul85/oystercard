require './lib/oystercard'
require './lib/station'
require './lib/journey'

p card = Oystercard.new
p s1 = Station.new(name: 'A', zone: 1)
p s2 = Station.new(name: 'B', zone: 1)

p card.top_up 90
p card.touch_in s1, Journey
p card.touch_out s2

p card.journey.entry_station
p card.journey.exit_station