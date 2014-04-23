class Asset < ActiveRecord::Base
	belongs_to :sm_content
	attr_accessor :assets, :original_filename, :content_type, :tempfile, :headers
	has_attached_file :asset#,
	                  #:path => ":rails_root/public/system/:asset/:id/:filename",
	                  #:url => "/system/:asset/:id/:filename"

	validates_attachment_content_type :asset, :content_type =>
		[ 'multipart/form-data',
		  'image/png',
		  'image/jpeg',
		  'image/gif',
		  'image/jpg',
		  'image/bmp',
		  'text/plain',
		  'application/pdf',
		  #'application/octet-stream',
		  'application/zip',
		  'application/msword',
		  'application/vnd.ms-excel',
		  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
		  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
			'application/x-msdownload'
		]
	#validates_something_else
	#validates_attachment :asset, #, :presence => true,
	#do_not_validate_attachment_file_type :asset
end