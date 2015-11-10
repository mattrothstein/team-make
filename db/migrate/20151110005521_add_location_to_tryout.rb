class AddLocationToTryout < ActiveRecord::Migration
  def change
    add_column :tryouts, :location, :strong
  end
end
