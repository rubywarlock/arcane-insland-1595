class CommentsController < ApplicationController
	before_action :get_user, only: [:create, :new]
	before_action :correct_author, only: [:edit, :destroy]
	before_action :set_per_page

	add_breadcrumb "home", :root_path

  def index

  end

  def show
	  #@comments = Comment.all
	  @comments = Comment.where(:sm_content_id => params[:id])

	  @smc = SmContent.find(params[:id])
	  @submenu = Submenu.find(@smc.submenu_id)

	  add_breadcrumb @submenu.sname, submenu_path(:id => @smc.submenu_id)
	  add_breadcrumb @smc.title, sm_content_path(@smc)
	  add_breadcrumb "Обсуждение"
  end

  def edit
  end

  def destroy
  end

  def new
	  @smc = SmContent.find(params[:sm_content_id])
	  @submenu = Submenu.find(@smc.submenu_id)
	  #@user = current_user

	  @comment = Comment.new

	  add_breadcrumb @submenu.sname, submenu_path(:id => @smc.submenu_id)
	  add_breadcrumb @smc.title, sm_content_path(@smc)
	  add_breadcrumb "Обсуждение", comment_path(@smc)
	  add_breadcrumb "Добавить комментарий"
  end

	def create
		@comment = Comment.new(params.require(:comment).permit(:sm_content_id, :user_id, :text))
		if @comment.save
			redirect_to comment_path(@comment.sm_content_id)
		else
			render root_url
		end
	end

	private
	def get_user
		session[:target_page] = session[:current_request]
		redirect_to(signin_path) unless signed_in?
	end

	def correct_author
		@user = User.find(current_user)
		redirect_to(comment_path[params[:id]]) unless current_user?(@user)
	end

	def set_per_page
		@comments_per_page = 3
	end
end