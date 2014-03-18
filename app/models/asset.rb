class Asset < ActiveRecord::Base
	belongs_to :sm_content
	has_attached_file :asset#, :content_type => ["text/plain", "application/msword"] #, :url=>"/tmp/assets_uploads/:basename.:extension", :path=>":rails_root/tmp/assets_uploads/:basename.:extension"
	validates_attachment_content_type :asset, :content_type => [ 'multipart/form-data', 'image/png', 'image/jpeg', 'image/gif', 'image/jpg', 'image/bmp', 'text/plain', 'application/pdf', 'application/octet-stream', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
	#validates_something_else
	#validates_attachment :asset, #, :presence => true,
	#do_not_validate_attachment_file_type :asset
end
