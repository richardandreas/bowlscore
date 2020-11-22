RSpec.describe PlayerScoreFrame do
  let(:score_frame) { PlayerScoreFrame.new(['2', '0'], tenth_frame) }
  let(:fouls_frame) { PlayerScoreFrame.new(['F, F'], tenth_frame) }
  let(:strike_frame) { PlayerScoreFrame.new(['10'], tenth_frame) }
  let(:spare_frame) { PlayerScoreFrame.new(['3', '7'], tenth_frame) }
  let(:tenth_frame) { PlayerScoreFrame.new(['2', '0']) }

  describe '#frame_score' do
    it { expect(score_frame.frame_score).to eq 2}
    it { expect(fouls_frame.frame_score).to eq 0 }
    it { expect(strike_frame.frame_score).to eq 12 }
    it { expect(spare_frame.frame_score).to eq 12 }
  end

  describe '#tenth_frame?' do
    it { expect(score_frame.tenth_frame?).to be_falsey }
    it { expect(tenth_frame.tenth_frame?).to be_truthy }
  end

  describe '#strike?' do
    it { expect(score_frame.strike?).to be_falsey }
    it { expect(strike_frame.strike?).to be_truthy }
  end

  describe '#spare?' do
    it { expect(score_frame.spare?).to be_falsey }
    it { expect(spare_frame.spare?).to be_truthy }
  end
end