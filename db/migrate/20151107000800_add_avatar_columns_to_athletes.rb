class AddAvatarColumnsToAthletes < ActiveRecord::Migration
  def up
    add_attachment :athletes, :avatar
  end

  def down
    remove_attachment :athletes, :avatar
  end
end
