class SmContentsController < ApplicationController
	#before_action only: [:show, :update, :destroy]

	def new
		@smc = SmContent.new(:submenu_id => params[:id])
		@smc.testoptions.build
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
		#@smc.testoptions.destroy(params[:sm_content_id])
		@smc.destroy
	end

	def create
		@content = SmContent.new(get_content)
		#@content.testoptions.build

		respond_to do |format|
			if @content.save
				format.html { redirect_to @content, notice: 'Survey was successfully created.' }
				format.json { render action: 'show', status: :created, location: @content }
			else
				format.html { render action: 'new' }
				format.json { render json: @content.errors, status: :unprocessable_entity }
			end
		end
	end


	private
  def get_content
	  params.require(:sm_content).permit(:title, :content, :submenu_id, testoptions_attributes:[:option])
	  #params.require(:survey).permit(:name, questions_attributes: [:survey_id, :content])
  end

	def get_submenu_id
		params[:id]
		#params.require(:sm_content).permit(:submenu_id)
	end

	def content_update_params
		params.require(:sm_content).permit(:title,:content)
	end


end
