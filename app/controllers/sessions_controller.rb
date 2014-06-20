class SessionsController < ApplicationController
	add_breadcrumb "home", :root_path

	def new

		add_breadcrumb "sign in"
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			cookies.clear
			sign_in user
			if session[:target_page]
				path = session[:target_page]

				#session[:last_uri] = user
				session[:target_page] = user_path(user)

				redirect_to path
			else
				redirect_to user
			end
		else
			flash[:error] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
