class UsersController < ApplicationController
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
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			render 'users/new'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			if @user.destroy
				#flash[:success] = "User was successfully deleted."
				format.html { redirect_to users_path, notice: 'User was successfully updated.' }
			else
				format.html { render action: "index" }
			end
		end
	end
end