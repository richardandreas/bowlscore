# Prints the scoring table to console
class ScoreTableLogger
  class << self
    # Prints the table header
    def print_header
      print_line = "Frames"

      10.times do |index|
        print_line << "\t\t#{index + 1}"
      end

      puts print_line
    end

    # Prints the whole table hody
    def print(player_score, player_name)
      puts player_name
      print_pinfalls(player_score.parsed_rolls, player_score.rolls)
      print_scores(player_score.scores)
    end

    def print_pinfalls(parsed_rolls, rolls)
      print_line  = "Pinfalls"
      table_index = 0

      parsed_rolls.each_with_index do |score, index|
        if rolls[index] == 'F'
          print_line << "\tF"
        elsif score == 10
          print_line << "\t" if table_index < 18
          print_line << "\tX"
          table_index += 1
        elsif (table_index % 2 == 1) && (parsed_rolls[index - 1] + score == 10)
          print_line << "\t/"
        else
          print_line << "\t#{score}"
        end

        table_index += 1
      end

      puts print_line
    end

    def print_scores(scores)
      print_line = "Score"
  
      scores.each do |score|
        print_line << "\t\t#{score}"
      end

      puts print_line
    end
  end
end