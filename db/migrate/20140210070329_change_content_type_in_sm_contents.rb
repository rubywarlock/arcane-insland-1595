class ChangeContentTypeInSmContents < ActiveRecord::Migration
  def change
	  change_column :sm_contents, :content, :text
  end
end
