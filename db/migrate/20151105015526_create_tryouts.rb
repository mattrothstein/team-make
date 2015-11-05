class CreateTryouts < ActiveRecord::Migration
  def change
    create_table :tryouts do |t|
      t.belongs_to :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
