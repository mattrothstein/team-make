class AddAthleteRefToSpots < ActiveRecord::Migration
  def change
    add_reference :spots, :athlete, index: true, foreign_key: true
  end
end
