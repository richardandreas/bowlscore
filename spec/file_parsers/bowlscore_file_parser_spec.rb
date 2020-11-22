RSpec.describe BowlscoreFileParser do
  let(:path_to_file) { './spec/support/test-input-1.txt' }

  describe '#parse' do
    subject { BowlscoreFileParser.parse(path_to_file) }
    it { expect(subject).to be_a Array }
    it { expect(subject.length).to eq 35 }
    it { expect(subject.first).to eq ['Jeff', '10'] }
    it { expect(subject.last).to eq ['John', '0'] }
  end
end