class Submenu < ActiveRecord::Base
	#attr_accessible :sname, :genmenu_id
	belongs_to :genmenu
end
