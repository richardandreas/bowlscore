# Prints the scoring table to console
class ScoreTableLogger
  def initialize(frames, player_name)
    @frames      = frames
    @player_name = player_name
  end

  # Prints the table header
  def self.print_header
    print_line = "Frames"

    10.times do |index|
      print_line << "\t\t#{index + 1}"
    end

    puts print_line
  end

  # Prints the table body for one player
  def print
    puts @player_name
    print_pinfalls
    print_scores
  end

  def print_pinfalls
    print_line  = "Pinfalls"

    @frames.each do |frame|
      print_line << "\t" if frame.rolls.count == 1

      if frame.spare? && !(frame.tenth_frame?)
        print_line << "\t#{frame.rolls.first}"
        print_line << "\t/"
      else
        frame.rolls.each do |roll|
          print_line << "\t#{roll == '10' ? 'X' : roll}"
        end
      end
    end

    puts print_line
  end

  def print_scores
    print_line  = "Score"
    scores      = @frames.map { |frame| frame.frame_score }
    total_score = 0

    scores.each do |score|
      total_score += score
      print_line << "\t\t#{total_score}"
    end

    puts print_line
  end
end