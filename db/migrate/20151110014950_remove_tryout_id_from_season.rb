class RemoveTryoutIdFromSeason < ActiveRecord::Migration
  def change
    remove_column :seasons, :tryout_id, :integer
  end
end
