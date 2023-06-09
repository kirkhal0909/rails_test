class Player < ApplicationRecord
  belongs_to :team
  has_many :matches, Matches.lambda
end
