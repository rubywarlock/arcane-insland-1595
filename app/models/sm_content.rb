class SmContent < ActiveRecord::Base
	belongs_to :submenu

	has_many :assets, :dependent => :destroy
	validates_length_of :content, :maximum => 500
	accepts_nested_attributes_for :assets
end