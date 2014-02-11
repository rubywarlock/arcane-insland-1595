class SmContent < ActiveRecord::Base
	belongs_to :submenu
	has_many :attache
	#include Paperclip::Glue
	has_attached_file :attache
	accepts_nested_attributes_for :attache
end