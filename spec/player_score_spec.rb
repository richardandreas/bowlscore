RSpec.describe PlayerScore do
  let(:jeff_rolls) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1] }
  let(:john_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0] }

  let(:to_less_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9] }
  let(:to_much_rolls) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0, 2] }

  let(:jeff_score) { PlayerScore.new(jeff_rolls) }
  let(:john_score) { PlayerScore.new(john_rolls) }

  describe '#frames ' do
    it { expect(jeff_score.frames).to be_a Array }
    it { expect(jeff_score.frames.length).to eq 10 }
    it { expect(jeff_score.frames.first).to be_a Frame }
    it { expect(jeff_score.frames.first.rolls).to eq [10] }
    it { expect(jeff_score.frames.last.rolls).to eq [10, 8, 1] }
    it { expect(john_score.frames.first.rolls).to eq [3, 7] }
    it { expect(john_score.frames.last.rolls).to eq [3, 7] }
  end

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
  end
end