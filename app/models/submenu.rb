class Submenu < ActiveRecord::Base
	belongs_to :genmenu
	has_many :sm_contents#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true#, order: 'updated_at desc'
	accepts_nested_attributes_for :sm_contents
end