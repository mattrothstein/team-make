class RemovePasswprdDigestFromAthletes < ActiveRecord::Migration
  def change
    remove_column :athletes, :passwprd_digest, :string
  end
end
