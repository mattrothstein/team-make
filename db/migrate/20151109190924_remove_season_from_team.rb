class RemoveSeasonFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :season, :integer
  end
end
