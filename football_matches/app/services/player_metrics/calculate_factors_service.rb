module PlayerMetrics
  class CalculateFactorsService < ApplicationService
    attr_reader :player_metric

    def initialize(player_metric)
      @player_metric = player_metric
    end

    def call
      {
        run_ten_plus: player_metric.kilometers_run > 10,
        seventy_pass_success: player_metric.passes_success / player_metric.passes.to_f > 0.7,
        goal: player_metric.goals.positive?
      }
    end
  end
end
