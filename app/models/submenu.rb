class Submenu < ActiveRecord::Base
	belongs_to :genmenu
	has_many :sm_contents
	accepts_nested_attributes_for :sm_contents
end
