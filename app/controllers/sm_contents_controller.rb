class SmContentsController < ApplicationController
	before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
		@content = SmContent.new
  end

  def create
	  #@smenu = Submenu.find(params[:submenu_id])
	  #@content = @smenu.sm_contents.build(content_params)
	  #@content.save
	  #redirect_to @smenu


	  @content = Submenu.sm_contents.build(content_params)
	  if @content.save
		  flash[:success] = "Micropost created!"
		  redirect_to @content
	  else
		  render 'static_pages/home'
	  end



  end

  def destroy
  end

  def edit
		@content = SmContent.find(params[:id])
  end

	def update
		@content = SmContent.find(params[:id])

		respond_to do |format|
			if @content.update_attributes(params[:sm_content])
				format.html { redirect_to @content.genmenu, notice: 'Content was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_content
		@content = SmContent.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def content_params
		params.require(:sm_content).permit(:title,:content, :submenu_id)
	end
end
