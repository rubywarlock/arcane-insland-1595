class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.integer :sm_content_id
      t.string :file

      t.timestamps
    end
  end
end
