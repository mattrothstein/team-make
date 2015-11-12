class AddTelephoneToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :telephone, :string
  end
end
