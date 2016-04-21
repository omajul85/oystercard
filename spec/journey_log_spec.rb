require 'journey_log'

describe JourneyLog do
  let(:journey) { double(:journey, entry_station: entry_station, completed?: false) }
  let(:journey_class) { double(:journey_class, new: journey, start: journey)}
  let(:entry_station) { double(:station, name: "A", zone: 1) }
  let(:exit_station) { double(:station, name: "B", zone: 1) }
  subject(:journey_log) { described_class.new(journey_class) }
  
  describe "#start" do
    it "starts a new journey" do
      expect(journey_class).to receive(:new).with(entry_station)
      journey_log.start entry_station
    end
    
    it 'records a journey' do
      journey_log.start(entry_station)
      expect(journey_log.journeys).to include(journey)
    end
  end
end
