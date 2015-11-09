class CreateEvaluatedAthletes < ActiveRecord::Migration
  def change
    create_table :evaluated_athletes do |t|
      t.integer :athlete_id
      t.integer :tryout_id
      t.text :notes

      t.timestamps null: false
    end
  end
end
