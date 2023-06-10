class AddUniqValidations < ActiveRecord::Migration[7.0]
  def up
    change_column :teams, :name, :string, null: false, unique: true
    change_column :players, :full_name, :string, null: false
    change_column :matches, :team1_id, :integer, null: false, unique: true
    change_column :matches, :team2_id, :integer, null: false, unique: true
    change_column :matches, :time_start, :datetime, null: false
  end
end
