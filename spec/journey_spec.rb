require "journey"

describe Journey do 
	subject(:journey) {described_class.new}

	describe "initialization" do
		it "journey should not be completed" do
			expect(journey).not_to be_completed
		end
		
		it 'has a penalty fare by default' do
      expect(subject.fare).to eq described_class::PENALTY_FEE
    end
	end
	
	context "given an entry station" do
	  let(:entry_station) { double :station }
	  let(:exit_station) { double :station }
	  
	  before do
      journey.start(entry_station)
    end
	  
	  it "han an entry station" do
			expect(journey.entry_station).to eq entry_station	
		end
		
		it "returns a penalty fee if no exit station given" do
      expect(journey.fare).to eq described_class::PENALTY_FEE
    end
    
    context "and an exit station" do
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