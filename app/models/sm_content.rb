class SmContent < ActiveRecord::Base
	belongs_to :submenu

	default_scope order: { :updated_at => :desc }

<<<<<<< HEAD
	#has_many :assets, :dependent => :destroy
	has_many :attaches, :dependent => :destroy
	accepts_nested_attributes_for :attaches
=======
	has_many :assets, :dependent => :destroy
>>>>>>> fdea6e2d57fe86ba4efd0f9c8af8723abc526a5a
	validates_length_of :content, :maximum => 500
	accepts_nested_attributes_for :assets
end