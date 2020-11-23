# Class responsible for player score calculations.
# Initializes with an array of rolls from a single player and calculates the scores of the full
# game.
#
# attributes:
#   errors:       Array[String]
#   frames:       Array[PlayerScoreFrame]
#   rolls:        Array[String]
#
# functions:
#  valid?:        Boolean
#
class PlayerScore
  attr_reader :errors, :frames, :rolls

  def initialize(rolls)
    @rolls       = rolls
    @errors      = []
    @frames      = []
    @frame_index = 0

    mount_frame

    validate_positive_numbers
    validate_frame_length
    validate_tenth_frame
  end

  def valid?
    !@errors.any?
  end

  private

  # Mounts the array of frames recursively
  def mount_frame
    return if current_roll.nil?

    frame_rolls = []

    if last_frame?
      frame_rolls = last_rolls
      @frame_index += 3
    elsif strike?
      frame_rolls = [current_roll]
      @frame_index += 1
    else
      frame_rolls = [current_roll, next_roll]
      @frame_index += 2
    end

    new_frame  = PlayerScoreFrame.new(frame_rolls, mount_frame)
    @frames.prepend new_frame

    new_frame
  end

  # Checks if the rolls dataset is free of negative numbers
  def validate_positive_numbers
    if @frames.any? { |frame| frame.parsed_rolls.min < 0 }
      @errors << 'Negative points are not allowed'
    end
  end

  # Checks if there are exactly 10 frames
  def validate_frame_length
    if @frames.count < 10
      @errors << 'Number of rolls is too short'
    elsif @frames.count > 10
      @errors << 'Number of rolls is too long'
    end
  end

  # Checks for the third roll in tenth frame with strike
  def validate_tenth_frame
    if tenth_frame.strike? && tenth_frame.rolls.count < 3
      @errors << 'Tenth frame needs third roll'
    end
  end

  def tenth_frame
    @frames.last
  end

  def last_rolls
    @rolls[@frame_index..]
  end

  def next_roll
    @rolls[@frame_index + 1]
  end

  def current_roll
    @rolls[@frame_index]
  end

  def last_frame?
    byebug if @rolls[@frame_index..].nil?
    @rolls[@frame_index..].count <= 3
  end

  def strike?
    current_roll == "10"
  end
end