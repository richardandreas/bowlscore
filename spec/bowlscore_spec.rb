RSpec.describe Bowlscore do
  let(:header) { "Frames\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\n" }
  let(:jeff_pinfalls) { "Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1\n" }
  let(:jeff_scores) { "Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\n" }
  let(:john_pinfalls) { "Pinfalls\t3\t/\t6\t3\t\tX\t8\t1\t\tX\t\tX\t9\t0\t7\t/\t4\t4\tX\t9\t0\n" }
  let(:john_scores) { "Score\t\t16\t\t25\t\t44\t\t53\t\t82\t\t101\t\t110\t\t124\t\t132\t\t151\n" }
  let(:carl_pinfalls) { "Pinfalls\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\tX\tX\tX\n" }
  let(:carl_scores) { "Score\t\t30\t\t60\t\t90\t\t120\t\t150\t\t180\t\t210\t\t240\t\t270\t\t300\n" }

  describe '#start' do
    context 'valid file' do
      it { expect { Bowlscore.start('./spec/support/test-input-1.txt') }
          .to output(header + "Jeff\n" + jeff_pinfalls + jeff_scores +
                              "John\n" + john_pinfalls + john_scores).to_stdout }

      it { expect { Bowlscore.start('./spec/support/test-input-2.txt') }
           .to output(header + "Carl\n" + carl_pinfalls + carl_scores).to_stdout }
    end

    context 'invalid file' do
      it { expect { Bowlscore.start('./spec/support/test-input-3.txt') }
          .to output(header + "ERROR: Player: John: Tenth frame needs third roll\n").to_stdout }
    end
  end
end