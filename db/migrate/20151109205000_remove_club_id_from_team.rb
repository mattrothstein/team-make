class RemoveClubIdFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :club_id, :integer
  end
end
