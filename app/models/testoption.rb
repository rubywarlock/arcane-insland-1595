class Testoption < ActiveRecord::Base
	belongs_to :sm_content
	#validates_presence_of :option
	accepts_nested_attributes_for :sm_content
end
