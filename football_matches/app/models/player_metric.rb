class PlayerMetric < ApplicationRecord
  belongs_to :player
  belongs_to :match
  before_save :callback_update_factors

  def callback_update_factors
    self.factors = {
      run_ten_plus: kilometers_run > 10,
      seventy_pass_success: passes_success / passes.to_f > 0.7,
      goal: goals.positive?
    }
  end
end
