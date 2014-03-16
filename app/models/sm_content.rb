class SmContent < ActiveRecord::Base
	#include Paperclip::Glue
	belongs_to :submenu
	#has_many :attaches

	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets
end