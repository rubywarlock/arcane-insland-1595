class SmContentsController < ApplicationController
	before_action :set_content, :create_params, only: [:show, :update, :destroy]

  def index
	  @smc = SmContent.find_by_submenu_id(:submenu_id)

	  respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @smc }
	  end
  end

  def show
		@smc = SmContent.find(params[:id])
  end

	def edit
		@smc = SmContent.find(params[:id])
	end

	def update
		@smc = SmContent.find(params[:id])
		respond_to do |format|
			if @smc.update_attributes(content_update_params)
				format.html { redirect_to @smc, notice: 'Second menu was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end


	private
	# Use callbacks to share common setup or constraints between actions.

	def content_update_params
		params.require(:sm_content).permit(:title,:content)
	end

	def set_content
	end

	# Never trust parameters from the scary internet, only allow the white list through.

	def create_params
	end

end
