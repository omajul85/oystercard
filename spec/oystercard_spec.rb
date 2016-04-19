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

		it "raises error if exceeding MAX amount" do
		  oystercard.top_up described_class::MAXIMUM_BALANCE
		  expect { oystercard.top_up 1 }.to raise_error "Cannot exceed the limit of #{described_class::MAXIMUM_BALANCE}"
		end
	end

	describe "#deduct" do
		it "deducts money from its balance" do
			expect { oystercard.deduct 1 }.to change{ oystercard.balance }.by -1
		end
	end

	describe "#touch_in" do
		it "responds to being touched in" do
			oystercard.touch_in
			expect(oystercard).to be_in_journey
		end
	end

	describe "#touch_out" do
		it "responds to being touched out" do
			oystercard.touch_in
			oystercard.touch_out
			expect(oystercard).not_to be_in_journey
		end
	end

end