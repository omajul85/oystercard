require 'oystercard'
require 'journey'

describe Oystercard do
  let(:journey) { Journey }
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end

		it "has an empty list of journeys" do
			expect(oystercard.journeys).to be_empty
		end
  end

	describe "#top_up" do
		it "adds money to its balance" do
			expect { oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
		end

		it "raises error if exceeding maximum balance" do
		  oystercard.top_up described_class::MAXIMUM_BALANCE
		  expect { oystercard.top_up 1 }.to raise_error "Cannot exceed the limit of #{described_class::MAXIMUM_BALANCE}"
		end
	end

	describe "#touch_in" do
		before do
			oystercard.top_up 1
			oystercard.touch_in(entry_station, journey)
		end
		
		it "stores the entry station" do
			expect(oystercard.journey.entry_station).to eq entry_station
		end
		
		it 'will not touch in if below minimum balance' do
			allow(oystercard).to receive(:balance).and_return 0
			message = "Cannot touch in: balance must be at least #{Journey::MINIMUM_FARE}"
			expect { oystercard.touch_in(entry_station, journey) }.to raise_error message
		end
	end

	describe "#touch_out" do
		before do
			oystercard.top_up 1
			oystercard.touch_in(entry_station, journey)
		end
		
		it "stores the exit station" do
			oystercard.touch_out(exit_station)
			expect(oystercard.journey.exit_station).to eq exit_station
		end
		
		it "reduces the balance by minimum fare" do
			expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -(Journey::MINIMUM_FARE)
		end
	end
	
	describe "touching in and out" do
		it "creates one journey"do
			oystercard.top_up 1
			oystercard.touch_in(entry_station, journey)
			oystercard.touch_out(exit_station)
			expect(oystercard.journeys). to include journey
		end
	end
end