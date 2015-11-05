class AddDirectorToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :director, :string
  end
end
