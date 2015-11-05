class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.belongs_to :team, index: true, foreign_key: true
      t.integer :invite_status

      t.timestamps null: false
    end
  end
end
