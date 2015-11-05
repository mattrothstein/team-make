class AddEmailToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :email, :string
  end
end
