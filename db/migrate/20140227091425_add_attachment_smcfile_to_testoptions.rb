class AddAttachmentSmcfileToTestoptions < ActiveRecord::Migration
  def self.up
    change_table :testoptions do |t|
      t.attachment :smcfile
    end
  end

  def self.down
    drop_attached_file :testoptions, :smcfile
  end
end
