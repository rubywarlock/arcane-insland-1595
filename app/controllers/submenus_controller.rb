class SubmenusController < ApplicationController
	before_action :set_smenu, :set_contents, only: [:show, :edit, :update, :destroy]

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


	private
  # Use callbacks to share common setup or constraints between actions.
	def set_smenu
		@smenu = Submenu.find(params[:id])
	end

	def set_contents
		#@mmenu = Genmenu.find(params[:id])
		#@smc = @smenu.sm_contents.build(:submenu_id => params[:id])

		#@smenu = Submenu.find(params[:id])
		#@content = @gmenu.submenus.sm_contents.build(params[:submenu_id])
		#@content = @smenu.sm_contents.build(params[:submenu_id])
		#if @content.save
		#	flash[:success] = "Content created!"
		#	redirect_to [@gmenu, @smenu, @content]
		#else
		#	render 'static_pages/home'
		#end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def smenu_params
		params.require(:submenu).permit(:sname, :genmenu_id)
	end

	def smenu_update_params
		params.require(:submenu).permit(:sname)
	end

	def content_params
		#params.require(:submenu_id).permit(:title,:content, :submenu_id)
	end
end
