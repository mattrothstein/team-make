class AddAgeColumnToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :age, :integer
  end
end
