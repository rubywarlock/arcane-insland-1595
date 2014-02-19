class SmContent < ActiveRecord::Base
	belongs_to :submenu
	#has_many :attaches
	has_many :testoptions, :dependent => :destroy

	#include Paperclip::Glue
	has_attached_file :attache
	#accepts_nested_attributes_for :attaches
	accepts_nested_attributes_for :testoptions
end