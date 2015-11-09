class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.belongs_to :club, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.references :tryout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
