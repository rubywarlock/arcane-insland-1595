class CreateSmContents < ActiveRecord::Migration
  def change
    create_table :sm_contents do |t|
      t.string :content
      t.integer :submenu_id

      t.timestamps
    end
  end
end
