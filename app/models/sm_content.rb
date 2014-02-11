class SmContent < ActiveRecord::Base
	belongs_to :submenu
	has_many :attaches
	#include Paperclip::Glue
	has_attached_file :attache
	accepts_nested_attributes_for :attaches
end