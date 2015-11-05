class RenameColumnNameinTableClubstoClubName < ActiveRecord::Migration
  def change
    rename_column :clubs, :name, :club_name
  end
end
