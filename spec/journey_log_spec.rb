require 'journey_log'

describe JourneyLog do
  let(:journey) { double(:journey, entry_station: entry_station, completed?: false) }
  let(:journey_class) { double(:journey_class, new: journey, start: journey, finish: self) }
  let(:entry_station) { double(:station, name: "A", zone: 1) }
  let(:exit_station) { double(:station, name: "B", zone: 1) }
  subject(:journey_log) { described_class.new(journey_class) }
  
  describe "#start" do
    it 'starts and records a journey' do
      journey_log.start_journey(entry_station)
      expect(journey_log.journeys).to include(journey)
    end
  end
  
  describe "#finish" do
    before do 
      journey_log.start_journey(entry_station)
    end
    
    it 'finish a journey' do
      journey_log.finish_journey(exit_station)
      expect(journey_log.journeys).to include(journey)
    end
  end
  
  describe "#journeys" do 
    before do 
      5.times {
        journey_log.start_journey(entry_station)
        journey_log.finish_journey(exit_station)
      }
    end
    
    it "prints the list of journeys" do 
      journey_log.journeys
      expect(journey_log.journeys).to be_a(Array)
    end
  end
end