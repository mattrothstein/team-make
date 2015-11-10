class AddSeasonToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :season, index: true, foreign_key: true
  end
end
