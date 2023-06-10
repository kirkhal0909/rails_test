class PlayerMetric < ApplicationRecord
  belongs_to :player
  belongs_to :match
  validates :player, uniqueness: { scope: :match }

  before_save :callback_update_factors


  def callback_update_factors
    self.factors = PlayerMetrics::CalculateFactorsService.new(self).call
  end
end
