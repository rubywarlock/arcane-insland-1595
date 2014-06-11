class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update, :destroy]
	before_action :admin_user,     only: :destroy

	add_breadcrumb "home", :root_path

	def show
		@user = User.find(params[:id])

		add_breadcrumb "users", users_path#, submenu_path(:id => @smc.submenu_id)
		add_breadcrumb @user.name
	end

	def index
		@users = User.all

		add_breadcrumb "users"
	end

	def new
		@user = User.new
		add_breadcrumb "sign up"
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))

		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			render 'users/new'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def signed_in_user
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(users_url) unless current_user.admin?
		end

end