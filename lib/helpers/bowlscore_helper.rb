# General helper methds can be defined here.
module BowlscoreHelper
  # Groups mixed score array by player, returning a hashes containing the player name as key and
  # array of scores.
  def group_by_player(array)
    gruped_hash = {}

    array.each do |tuple|
      score = tuple.last
      array = gruped_hash[tuple.first].nil? ? [score] : gruped_hash[tuple.first].push(score)
      gruped_hash[tuple.first] = array
    end

    gruped_hash
  end
end