require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end

		it "is not in journey" do
			expect(oystercard).not_to be_in_journey
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
		it "responds to being touched in" do
			oystercard.top_up 1
			oystercard.touch_in
			expect(oystercard).to be_in_journey
		end
		
		it 'will not touch in if below minimum balance' do
			message = "Cannot touch in: balance must be at least #{described_class::MINIMUM_FARE}"
			expect { oystercard.touch_in }.to raise_error message
		end
	end

	describe "#touch_out" do
		before do
			oystercard.top_up 1
			oystercard.touch_in
		end
		
		it "reduces the balance by minimum fare" do
			expect { oystercard.touch_out }.to change{ oystercard.balance }.by -described_class::MINIMUM_FARE
		end
	end
	

end