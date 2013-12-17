class AddTitleToSmContent < ActiveRecord::Migration
  def change
    add_column :sm_contents, :title, :string
  end
end
