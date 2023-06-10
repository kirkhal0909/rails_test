class AddPlayerMetricsIndex < ActiveRecord::Migration[7.0]
  def up
    add_index :player_metrics, %i[player_id match_id], unique: true
  end
end
