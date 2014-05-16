class ApplicationController < ActionController::Base
	before_action :main_menu
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	include SessionsHelper

	private

	def main_menu
		@main_menu_items = Genmenu.order("created_at desc")
		@a_submenus = Submenu.order("created_at desc")
		@allcontent = SmContent.order("updated_at desc")
	end

  # FOR FULL FIRST LOAD APP
	#def initialize
	#	foo
	#end

	#def foo
	#	@main_menu_items = Genmenu.all
	#end

end
