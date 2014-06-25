class UserSettingsController < ApplicationController

	before_action :correct_user,   only: [:index]

	add_breadcrumb "home", :root_path

  def index
	  @user = User.find(params[:user_id])

	  add_breadcrumb "users", users_path#, submenu_path(:id => @smc.submenu_id)
	  add_breadcrumb @user.name, user_path(@user)
	  add_breadcrumb "настройки"
  end

	private
	def correct_user
		@user = User.find(params[:user_id])
		redirect_to(user_settings_path(current_user.id)) unless signed_in? && current_user?(@user)
	end
end