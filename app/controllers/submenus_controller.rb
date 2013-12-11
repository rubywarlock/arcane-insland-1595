class SubmenusController < ApplicationController
	before_action :set_smenu, only: [:show, :edit, :update, :destroy]

	def index
		@smenus = Submenu.find_by_genmenu_id(:genmenu_id)

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @smenus }
		end
	end

	def show
		@smenu = Submenu.find(params[:id])

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @smenu }
		end
	end

	def new
		@smenu = Submenu.new
	end

  def create
	  @gmenu = Genmenu.find(params[:genmenu_id])
	  @submenu = @gmenu.submenus.build(smenu_params)
	  @submenu.save
	  redirect_to @gmenu
  end



  def destroy
  end

  def edit
	  @smenu = Submenu.find(params[:id])
  end

	def update
		@smenu = Submenu.find(params[:id])
		respond_to do |format|
			if @comment.update_attributes(params[:submenu])
				format.html { redirect_to @smenu.genmenu, notice: 'Comment was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

  def transfer
  end


	private
  # Use callbacks to share common setup or constraints between actions.
	def set_smenu
		@smenu = Submenu.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def smenu_params
		params.require(:submenu).permit(:sname, :genmenu_id)
	end
end
