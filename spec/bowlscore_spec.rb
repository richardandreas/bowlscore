RSpec.describe Bowlscore do
  describe '#start' do
    it { expect { Bowlscore.start }.to output("Hello World!\n").to_stdout }
  end
end