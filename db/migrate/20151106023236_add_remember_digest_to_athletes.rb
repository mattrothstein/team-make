class AddRememberDigestToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :remember_digest, :string
  end
end
