require 'player_score_frame'
require 'player_score'
require 'score_table_logger'
require 'helpers/bowlscore_helper'
require 'file_parsers/bowlscore_file_parser'

# Main application class
class Bowlscore
  extend BowlscoreHelper

  def self.start(file_path)
    scores = BowlscoreFileParser.parse(file_path)
    player_scores = group_by_player(scores)

    ScoreTableLogger.print_header

    player_scores.each do |player_name, scores|
      player_score = PlayerScore.new(scores)

      unless player_score.valid?
        puts "ERROR: Player: #{player_name}: #{player_score.errors.join("\n")}"
        next
      end

      ScoreTableLogger.new(player_score.frames, player_name).print
    end
  end
end