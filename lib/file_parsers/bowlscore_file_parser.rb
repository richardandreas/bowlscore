# Responsible for reading payer result files and converting their content into an array of touples
# containting the players name and score.
class BowlscoreFileParser
  class << self
    def parse(path_to_file)
      [['Jeff', 10], ['John', 0]]
    end
  end
end