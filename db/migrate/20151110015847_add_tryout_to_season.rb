class AddTryoutToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :tryout_id, :integer, {foreign_key: true}
  end
end
