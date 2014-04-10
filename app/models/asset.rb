class Asset < ActiveRecord::Base
	belongs_to :sm_content
	has_attached_file :asset
	validates_attachment_content_type :asset, :content_type =>
		[ 'multipart/form-data',
		  'image/png',
		  'image/jpeg',
		  'image/gif',
		  'image/jpg',
		  'image/bmp',
		  'text/plain',
		  'application/pdf',
		  'application/octet-stream',
		  'application/msword',
		  'application/vnd.ms-excel',
		  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
			'application/x-msdownload'
		]
	#validates_something_else
	#validates_attachment :asset, #, :presence => true,
	#do_not_validate_attachment_file_type :asset
end
