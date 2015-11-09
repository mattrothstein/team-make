class AddAttachmentLogoToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :clubs, :logo
  end
end
