require 'journey_log'

describe JourneyLog do
  let(:journey) { double(:journey, entry_station: entry_station, completed?: false, start: entry_station, finish: nil, fare: 1) }
  let(:journey_class) { double(:journey_class, new: journey, start_journey: entry_station, finish_journey: self) }
  let(:entry_station) { double(:station, name: "A", zone: 1) }
  let(:exit_station) { double(:station, name: "B", zone: 1) }
  subject(:journey_log) { described_class.new(journey_class) }

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
      allow(journey).to receive(:finish).with(exit_station).and_return(journey)
      journey_log.finish_journey(exit_station)
      expect(journey_log.journeys).to include(journey)
    end

    it "calculate the fare" do
      journey_log.finish_journey(exit_station)
      expect(journey_log.get_fare).to eq 1
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