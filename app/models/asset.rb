class Asset < ActiveRecord::Base
	belongs_to :sm_content
	has_attached_file :asset#, :url=>"/tmp/assets_uploads/:basename.:extension", :path=>":rails_root/tmp/assets_uploads/:basename.:extension"
	do_not_validate_attachment_file_type :asset
end
