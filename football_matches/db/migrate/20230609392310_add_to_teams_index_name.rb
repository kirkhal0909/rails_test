class AddToTeamsIndexName < ActiveRecord::Migration[7.0]
  def up
    add_index :teams, :name, unique: true
  end
end
