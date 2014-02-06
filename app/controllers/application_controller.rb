class ApplicationController < ActionController::Base
	before_action :main_menu
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private

	def main_menu
		@main_menu_items = Genmenu.all
		@a_submenus = Submenu.all
	end


  # FOR FULL FIRST LOAD APP
	#def initialize
	#	foo
	#end

	#def foo
	#	@main_menu_items = Genmenu.all
	#end

end
