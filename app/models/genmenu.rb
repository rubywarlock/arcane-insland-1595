class Genmenu < ActiveRecord::Base
	has_many :submenus
	accepts_nested_attributes_for :submenus
end