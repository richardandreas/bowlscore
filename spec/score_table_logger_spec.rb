RSpec.describe ScoreTableLogger do
  let(:player_rolls) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1] }
  let(:player_score) { PlayerScore.new(player_rolls) }

  let(:header) { "Frames\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10" }
  let(:pinfalls) { "Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1" }
  let(:scores) { "Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167" }

  describe '#print_header' do
    it { expect { ScoreTableLogger.print_header }.to output(header).to_stdout }
  end

  describe '#print_pinfalls' do
    it { expect { ScoreTableLogger.print_pinfalls(player_score) }.to output(pinfalls).to_stdout }
  end

  describe '#print_scores' do
    it { expect { ScoreTableLogger.print_scores(player_score) }.to output(scores).to_stdout }
  end

  describe '#print' do
    it { expect { ScoreTableLogger.print_scores(player_score, 'Jeff') }
         .to output(header + "\nJeff\n" + pinfalls + "\n" + scores + "\n").to_stdout }
  end
end