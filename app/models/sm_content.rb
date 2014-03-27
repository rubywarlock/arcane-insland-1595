class SmContent < ActiveRecord::Base
	belongs_to :submenu

	default_scope order: { :updated_at => :desc }

	has_many :assets, :dependent => :destroy
	validates_length_of :content, :maximum => 500
	accepts_nested_attributes_for :assets
end