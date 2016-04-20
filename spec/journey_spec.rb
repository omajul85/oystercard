require "journey"

describe Journey do 
	subject(:journey) { described_class.new(:station) }
	let(:station) { double :station, zone: 1 }

	describe "initialization" do
		it 'is created with an entry station' do
      expect(journey.entry_station).to eq :station
    end
		
		it "journey should not be completed" do
			expect(journey).not_to be_completed
		end
		
		it 'has a penalty fare by default' do
      expect(subject.fare).to eq described_class::PENALTY_FEE
    end
	end
	
	context "given an entry station" do
	 # subject(:journey) { described_class.new(entry_station: station) }

	  it "han an entry station" do
			expect(journey.entry_station).to eq :station	
		end
		
		it "returns a penalty fee if no exit station given" do
      expect(journey.fare).to eq described_class::PENALTY_FEE
    end
    
    context "and an exit station" do
      let(:exit_station) { double :station, zone: 1 }
      
      before do
        journey.finish(exit_station)
      end
      
      it "calculates a fare" do
        expect(journey.fare).to eq described_class::MINIMUM_FARE
      end
      
      it "knows if a journey is completed" do
        expect(journey).to be_completed
      end
    end
	end
end