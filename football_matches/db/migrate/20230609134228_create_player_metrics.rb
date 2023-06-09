class CreatePlayerMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :player_metrics do |t|
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.float :kilometers_run, default: 0.0
      t.integer :passes, default: 0
      t.integer :passes_success, default: 0
      t.integer :goals, default: 0

      t.timestamps
    end
  end
end
