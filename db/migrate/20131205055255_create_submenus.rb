class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :sname
      t.integer :genmenu_id

      t.timestamps
    end
    add_index :submenus, [:genmenu_id, :created_at]
  end
end