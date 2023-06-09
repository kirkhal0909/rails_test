class Team < ApplicationRecord
  has_many :players
  has_many :matches, Matches.lambda
end
