class SmContentsController < ApplicationController
	before_action :set_content, :create_params, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
		@content = SmContent.find(params[:id])
  end

  def new
	  @smc = SmContent.new
  end

  def create
	  #@smenu = Submenu.find(params[:submenu_id])
	  #@content = @smenu.sm_contents.build(content_params)
	  #@content.save
	  #redirect_to @smenu

	  #@smc = SmContent.find(params[:id])
	  @mmenu = Genmenu.find(params[:genmenu_id])
	  @smenu = @mmenu.submenus.build(:genmenu_id => params[:submenu_id])
	  @smc = @smenu.sm_contents.build(:submenu_id => params[:id,:title,:content])


	  #@mmenu = Genmenu.find(params[:genmenu_id])
	  #@smenu = Submenu.find(params[:submenu_id])
	  #@smc = @smenu.sm_contents.build(:submenu_id => params[:id,:title,:content])

	  #@reply.user = current_user

	  if @smc.save
		  flash[:success] = 'your Content has been posted!'
		  #redirect_to @smc
	  else
		  @mmenu = Genmenu.find(params[:genmenu_id])
		  render 'genmenus/show'
	  end



  end

  def destroy
  end

  def edit
		@content = SmContent.find(params[:id])
  end

	def update
		@content = SmContent.find(update_params)

		respond_to do |format|
			if @content.update_attributes(update_params)
				format.html { redirect_to @content.genmenu, notice: 'Content was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_content

		@smc = SmContent.new
		@mmenu = Genmenu.find(params[:genmenu_id])
		@smenu = Submenu.find(params[:submenu_id])
		#@smc = @smenu.sm_contents.build(:submenu_id => params[:id])

		#@content = SmContent.find(params[:id])
		#@smenu = Submenu.find(params[:submenu_id])
		#@mainmenu = Genmenu.find(params[:genmenu_id])

		#params.require(:survey).permit(:name,:questions_attributes => [:id, :content,:answers_attributes => [:id, :answer, :participant_id]])
		#params.require(:survey).permit(:name,:questions_attributes => [:id, :content,:answers_attributes => [:id, :answer, :participant_id]])

	end

	# Never trust parameters from the scary internet, only allow the white list through.

	def new_content
		@content = SmContent.new
	end

	def create_params
		#params.require(:sm_content).permit(:title,:content,:submenu_id)
	end

	def update_params
		params.require(:sm_content).permit(:title,:content,:id)
	end
end
