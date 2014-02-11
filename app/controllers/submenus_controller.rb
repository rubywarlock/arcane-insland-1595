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
		@contents = SmContent.new(get_smenu_id)
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @smenu }
		end
	end

	def new
		@smenu = Submenu.new
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @smenu }
		end
	end

  def create
	  @gmenu = Genmenu.find(params[:id])
	  @submenu = @gmenu.submenus.build(smenu_params)
	  @submenu.save
	  redirect_to @submenu
  end



  def destroy
  end

  def edit
	  @smenu = Submenu.find(params[:id])
  end

	def update
		@smenu = Submenu.find(params[:id])
		respond_to do |format|
			if @smenu.update_attributes(smenu_update_params)
				format.html { redirect_to @smenu.genmenu, notice: 'Second menu was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

  def transfer
  end

	def SmContentAdd
		@smenu = Submenu.find(params[:id])
		@content = @smenu.sm_contents.build(get_content)
		if @content.save
			@content = SmContent.new
		end
		render :action => :show
	end


	private
  # Use callbacks to share common setup or constraints between actions.
	def get_content
		params.require(:contents).permit(:title,:content,:attache_file_name)
	end

	def get_smenu_id
		params.permit(:id)
	end

	def set_smenu
		@smenu = Submenu.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def smenu_params
		params.require(:submenu).permit(:sname, :genmenu_id)
	end

	def smenu_update_params
		params.require(:submenu).permit(:sname)
	end

end
