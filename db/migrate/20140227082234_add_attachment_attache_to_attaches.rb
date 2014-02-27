class AddAttachmentAttacheToAttaches < ActiveRecord::Migration
  def self.up
    change_table :attaches do |t|
      t.attachment :attache
    end
  end

  def self.down
    drop_attached_file :attaches, :attache
  end
end
