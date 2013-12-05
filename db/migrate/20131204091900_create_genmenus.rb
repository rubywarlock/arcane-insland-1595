class CreateGenmenus < ActiveRecord::Migration
  def change
    create_table :genmenus do |t|
      t.string :genmenuname

      t.timestamps
    end
  end
end
