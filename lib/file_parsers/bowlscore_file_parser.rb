# Responsible for reading payer result files and converting their content into an array of tuples
# containting the players name and score.
class BowlscoreFileParser
  class << self
    def parse(path_to_file)
      @file = File.open(path_to_file)
      @file.read.split("\n").map do |line|
        player, score = line.split(" ")
        [player, score]
      end
    end
  end
end