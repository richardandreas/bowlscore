RSpec.describe PlayerScore do
  let(:jeff_rolls) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1] }
  let(:john_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0] }

  let(:to_less_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 9] }
  let(:to_much_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0, 2] }
  let(:no_third_roll) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9] }

  let(:jeff_score) { PlayerScore.new(jeff_rolls) }
  let(:john_score) { PlayerScore.new(john_rolls) }

  describe '#scores' do
    it { expect(jeff_score.scores).to be_a Array }
    it { expect(jeff_score.scores.length).to eq 10 }
    it { expect(jeff_score.scores).to eq [20, 39, 48, 66, 74, 84, 90, 120, 148, 167] }
    it { expect(john_score.scores).to eq [16, 25, 44, 53, 82, 101, 110, 124, 132, 151] }
  end

  describe '#valid?' do
    it { expect(jeff_score.valid?).to be_truthy }
    it { expect(john_score.valid?).to be_truthy }
    it { expect(PlayerScore.new(to_less_rolls).valid?).to be_falsey }
    it { expect(PlayerScore.new(to_much_rolls).valid?).to be_falsey }
    it { expect(PlayerScore.new(to_less_rolls).errors.first).to eq("Number of rolls is too short") }
    it { expect(PlayerScore.new(to_much_rolls).errors.first).to eq("Number of rolls is too long") }
    it { expect(PlayerScore.new(no_third_roll).errors.first).to eq("Tenth frame needs third roll") }
  end
end