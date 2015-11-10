class CreateTryouts < ActiveRecord::Migration
  def change
    create_table :tryouts do |t|
      t.text :location
      t.date :date
      t.string :time
      t.belongs_to :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
