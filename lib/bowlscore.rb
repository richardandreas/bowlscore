require 'player_score'
require 'score_table_logger'
require 'helpers/bowlscore_helper'
require 'file_parsers/bowlscore_file_parser'

# For debugging
require 'byebug'

# Main application class
class Bowlscore
  extend BowlscoreHelper

  def self.start(file_path)
    scores = BowlscoreFileParser.parse(file_path)
    player_scores = group_by_player(scores)

    ScoreTableLogger.print_header

    player_scores.each do |player_name, scores|
      player_score = PlayerScore.new(scores)

      ScoreTableLogger.print(player_score, player_name)
    end
  end
end

# Runs the main application
Bowlscore.start('./spec/support/test-input-1.txt')