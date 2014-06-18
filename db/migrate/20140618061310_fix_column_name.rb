class FixColumnName < ActiveRecord::Migration
  def change
	  rename_column :comments, :smcontent_id, :sm_content_id
  end
end