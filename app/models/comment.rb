class Comment < ActiveRecord::Base
	belongs_to :sm_content
	belongs_to :user

	default_scope order: { :updated_at => :desc }
end
