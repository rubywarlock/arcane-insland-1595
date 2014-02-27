class SmContent < ActiveRecord::Base
	#include Paperclip::Glue
	belongs_to :submenu
	#has_many :attaches

	has_many :testoptions, :dependent => :destroy
	has_attached_file :upload



	#has_attached_file :attache
	#accepts_nested_attributes_for :attaches
	accepts_nested_attributes_for :testoptions
end