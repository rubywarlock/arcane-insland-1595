class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :sname
      t.integer :genmenu_id

      t.timestamps
    end
  end
end
