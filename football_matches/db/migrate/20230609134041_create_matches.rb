class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :time_start
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps
    end

    add_foreign_key :matches, :teams, column: :team1_id
    add_foreign_key :matches, :teams, column: :team2_id
  end
end
