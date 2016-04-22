require 'journey_log'
require 'journey'

describe JourneyLog do
  let(:entry_station) { double(:station, name: "A", zone: 1) }
  let(:exit_station) { double(:station, name: "B", zone: 1) }
  subject(:journey_log) { described_class.new(Journey) }

  describe "#initialize" do
    it "has an empty list of journeys" do
      expect(journey_log.journeys).to be_empty
    end
  end

  describe "#start" do
    it 'starts a journey' do
      expect(journey_log.start_journey(entry_station)).to eq entry_station
    end
  end

  describe "#finish and records a journey" do
    before do
      journey_log.start_journey(entry_station)
    end

    it 'finish a journey' do
      journey = journey_log.finish_journey(exit_station)
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