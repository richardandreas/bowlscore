# Initializes with an array of rolls from a single player and calculates the scores of the full
# game.
class PlayerScore
  attr_reader :rolls, :scores, :total_score

  def initialize(rolls)
    @rolls = rolls

    calculate
  end

  def valid?
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
  end

  def next_points
    @rolls[@frame_index + 1]
  end

  def after_next_points
    @rolls[@frame_index + 2]
  end

  def next_two_points
    next_points + after_next_points
  end

  def current_points
    @rolls[@frame_index]
  end

  def strike?
    current_points == 10
  end

  def spare?
    current_points + next_points == 10
  end
end