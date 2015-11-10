class AddDateToTryout < ActiveRecord::Migration
  def change
    add_column :tryouts, :date, :date
  end
end
