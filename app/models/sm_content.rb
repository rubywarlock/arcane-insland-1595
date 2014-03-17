class SmContent < ActiveRecord::Base
	belongs_to :submenu

	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets
end