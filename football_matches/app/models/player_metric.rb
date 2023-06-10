class PlayerMetric < ApplicationRecord
  belongs_to :player
  belongs_to :match
  before_save :callback_update_factors

  def callback_update_factors
    self.factors = PlayerMetrics::CalculateFactorsService.new(self).call
  end
end
