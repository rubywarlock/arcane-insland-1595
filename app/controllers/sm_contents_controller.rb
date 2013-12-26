class SmContentsController < ApplicationController
	before_action :set_content, :create_params, only: [:show, :edit, :update, :destroy]

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

  def new

  end

  def create

  end

  def destroy
  end

  def edit

  end

	def update

	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_content


	end

	# Never trust parameters from the scary internet, only allow the white list through.

	def new_content

	end

	def create_params

	end

	def update_params

	end
end
