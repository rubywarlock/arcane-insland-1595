class SmContent < ActiveRecord::Base
	belongs_to :submenu

	default_scope order: { :updated_at => :desc }

	#has_many :assets, :dependent => :destroy
	has_many :attaches, :dependent => :destroy
	accepts_nested_attributes_for :attaches
	validates_length_of :content, :maximum => 500
	#accepts_nested_attributes_for :assets
end