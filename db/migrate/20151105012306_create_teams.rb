class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :club, index: true, foreign_key: true
      t.string :name
      t.integer :age_group
      t.string :coach
      t.integer :roster_size
      t.int :season

      t.timestamps null: false
    end
  end
end
