class SubmenusController < ApplicationController
	before_action :set_smenu, only: [:show, :edit, :update, :destroy]

	add_breadcrumb "home", :root_path

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

	def show
		@smenu = Submenu.find(params[:id])

		#add_breadcrumb "home", :root_path
		add_breadcrumb @smenu.sname, submenu_path(:id => @smenu.id)

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @smenu }
		end
	end

	#def SmContentAdd
	#	@smenu = Submenu.find(params[:id])
	#	@content = SmContent.new(get_content)
	#	#@content.testoptions.build

	#	respond_to do |format|
	#		if @content.save
	#			format.html { redirect_to @content, notice: 'Survey was successfully created.' }
	#			format.json { render action: 'show', status: :created, location: @content }
	#		else
	#			format.html { render action: 'new' }
	#			format.json { render json: @content.errors, status: :unprocessable_entity }
	#		end
	#	end
	#end

	private
  # Use callbacks to share common setup or constraints between actions.

	def get_content
		#params.require(:contents).permit(:title,:content,:attache)
		params.require(:sm_contents).permit(:id, :title, :content, :testoptions => [:option])

		#params.require(:survey).permit(:name,questions_attributes: [:content, :id, :survey_id,answers_attributes: [:content, :id, :questions_id]])
	end

	def get_opt
		#params.require(:contents).permit(:title,:content,:attache)
		params.require(:sm_contents).permit(:id, testoptions: [:option])

		#params.require(:survey).permit(:name,questions_attributes: [:content, :id, :survey_id,answers_attributes: [:content, :id, :questions_id]])
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
