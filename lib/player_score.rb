# Initializes with an array of rolls from a single player and calculates the scores of the full
# game.
class PlayerScore
  attr_reader :errors, :parsed_rolls, :rolls, :scores, :total_score, :valid

  def initialize(rolls)
    @rolls        = rolls
    @parsed_rolls = rolls.map { |score| score.to_i }
    @errors       = []

    validate_positive_numbers
    validate_tenth_frame

    calculate if valid?
  end

  def valid?
    !@errors.any?
  end

  private

  # Calculates the scores of the player
  def calculate
    @scores      = []
    @total_score = 0
    @frame_index = 0

    10.times do
      if strike?
        @total_score += (10 + next_two_points)
        @frame_index += 1
      elsif spare?
        @total_score += (10 + after_next_points)
        @frame_index += 2
      else
        @total_score += (current_points + next_points)
        @frame_index += 2
      end

      @scores << @total_score
    end

  rescue TypeError => e
    @errors << 'Number of rolls is too short'
  end

  # Checks if the rolls dataset is free of negative numbers
  def validate_positive_numbers
    @errors << 'Negative points are not allowed' if @parsed_rolls.any? { |n| n < 0 }
  end

  # Checks for the third roll in tenth frame with strike
  def validate_tenth_frame
    @parsed_rolls_count = @parsed_rolls.count + @parsed_rolls.count(10)

    if @parsed_rolls_count == 21 && @parsed_rolls[-2] == 10
      @errors << 'Tenth frame needs third roll'
    elsif @parsed_rolls_count >= 21 && !third_roll_in_tenth_frame
      @errors << 'Number of rolls is too long'
    end
  end

  def third_roll_in_tenth_frame
    @parsed_rolls_count == 22 && @parsed_rolls[-3] == 10
  end

  def next_points
    @parsed_rolls[@frame_index + 1]
  end

  def after_next_points
    @parsed_rolls[@frame_index + 2]
  end

  def next_two_points
    next_points + after_next_points
  end

  def current_points
    @parsed_rolls[@frame_index]
  end

  def strike?
    current_points == 10
  end

  def spare?
    current_points + next_points == 10
  end
end