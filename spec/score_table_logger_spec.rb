RSpec.describe ScoreTableLogger do
  let(:player_rolls) { ['10', '7', '3', '9', '0', '10', '0', '8', '8', '2', 'F', '6', '10', '10', '10', '8', '1'] }
  let(:all_fouls_rolls) { Array.new(20, 'F') }

  let(:player_frames) { PlayerScore.new(player_rolls).frames }
  let(:all_fouls_frames) { PlayerScore.new(all_fouls_rolls).frames }

  let(:player_logger) { ScoreTableLogger.new(player_frames, 'Jeff') }
  let(:all_fouls_logger) { ScoreTableLogger.new(all_fouls_frames, 'John') }

  let(:header) { "Frames\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\n" }
  let(:pinfalls) { "Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1\n" }
  let(:scores) { "Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\n" }

  let(:all_fouls_pinfalls) { "Pinfalls" + Array.new(20, "\tF").join + "\n" }
  let(:all_fouls_scores) { "Score" + Array.new(10, "\t\t0").join + "\n" }

  describe '#print_header' do
    it { expect { ScoreTableLogger.print_header }.to output(header).to_stdout }
  end

  describe '#print_pinfalls' do
    context 'average game' do
      it { expect { player_logger.print_pinfalls }.to output(pinfalls).to_stdout }
    end

    context 'all fouls' do
      it { expect { all_fouls_logger.print_pinfalls }.to output(all_fouls_pinfalls).to_stdout }
    end
  end

  describe '#print_scores' do
    context 'average game' do
      it { expect { player_logger.print_scores }.to output(scores).to_stdout }
    end

    context 'all fouls' do
      it { expect { all_fouls_logger.print_scores }.to output(all_fouls_scores).to_stdout }
    end
  end

  describe '#print' do
    it { expect { player_logger.print }
         .to output("Jeff\n" + pinfalls + scores).to_stdout }
  end
end