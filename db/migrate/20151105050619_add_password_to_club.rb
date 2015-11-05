class AddPasswordToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :password_digest, :string
  end
end
