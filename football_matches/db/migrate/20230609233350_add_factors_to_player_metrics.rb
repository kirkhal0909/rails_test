class AddFactorsToPlayerMetrics < ActiveRecord::Migration[7.0]
  def change
    add_column :player_metrics, :factors, :jsonb, default: {}, null: false
  end
end
