class Genmenu < ActiveRecord::Base
	has_many :submenus, :dependent => :destroy
	accepts_nested_attributes_for :submenus
end