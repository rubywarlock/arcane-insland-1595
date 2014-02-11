class AddFilenameToAttaches < ActiveRecord::Migration
  def change
    add_column :attaches, :filename, :string
  end
end
