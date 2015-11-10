class AddTimeToTryout < ActiveRecord::Migration
  def change
    add_column :tryouts, :time, :time
  end
end
