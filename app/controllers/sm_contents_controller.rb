class SmContentsController < ApplicationController
	#before_action only: [:show, :update, :destroy]

	def new
		@smc = SmContent.new#(:submenu_id => params[:id])
		#@assets = Asset.new
		@smc.assets.build
		@submenu_id = get_submenu_id

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @smc }
		end
	end

  def index
	  @smc = SmContent.find_by_submenu_id(:submenu_id)

	  respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @smc }
	  end
  end

  def show
		@smc = SmContent.find(params[:id])
		@submenu_id = params[:submenu_id]
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

	def destroy
		@smc = SmContent.find(params[:id])
		@submenu_id = params[:submenu_id]
		#@smc.testoptions.destroy(params[:sm_content_id])
		#@smc.destroy
		respond_to do |format|
			if @smc.destroy
				format.html { redirect_to submenu_path(@submenu_id), notice: 'Second menu was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

	def create
		@content = SmContent.new(get_content)
		@submenu_id = params[:submenu_id]

		respond_to do |format|
			if @content.save

				#params[:assets_attributes][:asset].each do |file|
				#	@document = Document.new(:document => file)
				#	@document.save
				#end

				format.html { redirect_to sm_content_path(@content, params: {submenu_id: @content.submenu_id} ), notice: 'Survey was successfully created.' }
				format.json { render action: 'show', status: :created, location: @content }
			else
				format.html { render action: 'new' }
				format.json { render json: @content.errors, status: :unprocessable_entity }
			end
		end
	end


	private
  def get_content
	  #params.require(:sm_content).permit(:title, :content, :submenu_id, assets_attributes: [:tempfile, :original_filename, :content_type, :headers])
	  #params.require(:sm_content).permit(:title, :content, :submenu_id, assets_attributes: [:asset, :tempfile, :original_filename, :content_type, :headers])
	  params.require(:sm_content).permit(:title, :content, :submenu_id, assets_attributes: [:asset])
	  #params.require(:sm_content).permit(:title, :content, :submenu_id, :asset)
	  #params.require(:survey).permit(:name, questions_attributes: [:survey_id, :content])
  end

	def get_asset
		params.require(:sm_content).permit(assets_attributes: [:asset])
	end

	def get_submenu_id
		params[:id]
		#params.require(:sm_content).permit(:submenu_id)
	end

	def content_update_params
		params.require(:sm_content).permit(:title,:content)
	end


end
