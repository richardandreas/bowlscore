# Class responsible for storing frame information like rolls and total score.
#
# attributes:
#   next_frame:   PlayerScoreFrame
#   parsed_rolls: Array[Integer]
#   rolls:        Array[String]
#
# functions:
#  frame_score:   Integer
#  tenth_frame?:  Boolean
#  strike?:       Boolean
#  spare?         Boolean
#
class PlayerScoreFrame
  attr_reader :next_frame, :parsed_rolls, :rolls

  def initialize(rolls, next_frame = nil)
    @rolls        = rolls
    @parsed_rolls = rolls.map { |score| score.to_i }
    @next_frame   = next_frame
  end

  # Calculates the score made in this single frame
  def frame_score
    return @frame_score unless @frame_score.nil?

    if tenth_frame?
      @frame_score = sum_of_rolls
    else
      if strike?
        @frame_score = (10 + next_two_points)
      elsif spare?
        @frame_score = (10 + next_point)
      else
        @frame_score = sum_of_rolls
      end
    end

    @frame_score
  end

  def tenth_frame?
    @next_frame.nil?
  end

  def strike?
    @parsed_rolls[0] == 10
  end

  def spare?
    sum_of_rolls == 10 && !(strike?)
  end

  private

  def next_two_points
    if @next_frame.rolls.count == 1
      @next_frame.parsed_rolls[0] + @next_frame.next_frame.parsed_rolls[0]
    else
      @next_frame.parsed_rolls[0] + @next_frame.parsed_rolls[1]
    end
  end

  def next_point
    @next_frame.parsed_rolls[0]
  end

  def sum_of_rolls
    @parsed_rolls.inject(:+)
  end
end