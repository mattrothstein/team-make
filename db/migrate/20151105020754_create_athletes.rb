class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.date :dob
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
