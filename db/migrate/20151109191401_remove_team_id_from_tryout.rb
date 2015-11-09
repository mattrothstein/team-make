class RemoveTeamIdFromTryout < ActiveRecord::Migration
  def change
    remove_column :tryouts, :team_id, :integer
  end
end
