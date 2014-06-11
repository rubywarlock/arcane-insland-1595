class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :operator, :boolean, default: false
  end
end
