class AddPasswordDigestToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :password_digest, :string
  end
end
