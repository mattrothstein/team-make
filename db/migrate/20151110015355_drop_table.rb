class DropTable < ActiveRecord::Migration
  def change
    drop_table :tryouts
  end
end
