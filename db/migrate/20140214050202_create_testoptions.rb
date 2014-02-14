class CreateTestoptions < ActiveRecord::Migration
  def change
    create_table :testoptions do |t|
      t.string :option
      t.integer :sm_content_id

      t.timestamps
    end
  end
end
