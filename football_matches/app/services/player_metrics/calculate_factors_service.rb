module PlayerMetrics
  class CalculateFactorsService < ApplicationService
    attr_reader :player_metric

    def initialize(player_metric)
      @player_metric = player_metric
    end

    def call
      {
        run_ten_plus: run_ten_plus,
        seventy_pass_success: seventy_pass_success,
        goal: goal
      }
    end

    private

    def run_ten_plus
      player_metric.kilometers_run.to_f > 10
    end

    def seventy_pass_success
      return false if player_metric.passes.in?([0, nil])

      player_metric.passes_success.to_i / player_metric.passes.to_f > 0.7
    end

    def goal
      player_metric.goals&.positive?
    end
  end
end
