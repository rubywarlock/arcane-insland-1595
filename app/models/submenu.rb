class Submenu < ActiveRecord::Base
	#attr_accessible :sname, :genmenu_id
	belongs_to :genmenu
	has_many :sm_contents
end
