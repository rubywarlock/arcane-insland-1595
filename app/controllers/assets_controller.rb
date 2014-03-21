class AssetsController < ApplicationController
  #before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    #@assets = Asset.where(:sm_content_id => params[:sm_content_id])
		#@smc = SmContent.find(params[:sm_content_id])
  end

  # GET /assets/1
  # GET /assets/1.json

  # GET /assets/new


  def deleteassets
	  @assets = Asset.where(:sm_content_id => params[:sm_content_id])
	  @smc = SmContent.find(params[:sm_content_id])
  end

  # GET /assets/1/edit
  def edit
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  def new
	  @smc = SmContent.find(params[:sm_content_id])
	  @assets = Asset.new
	  #@allassets = Asset.where(:sm_content_id => params[:sm_content_id])

		#@sm_id = params[:sm_content_id]

  end

  # POST /assets
  # POST /assets.json
  def create
	  @asset = Asset.new(asset_params)
	  @smc = SmContent.find(params[:asset][:sm_content_id])


	  #@smc = SmContent.find(asset_params)
	  #@smc.assets.build

	  respond_to do |format|
		  if @asset.save
			  format.html { redirect_to @smc, notice: 'Asset was successfully created.' }
			  format.json { render action: 'show', status: :created, location: @asset }
		  else
			  format.html { render action: 'new' }
			  format.json { render json: @asset.errors, status: :unprocessable_entity }
		  end
	  end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def asset_params
	  #params.require(:sm_content).permit(:title, :content, :sm_content_id, :assets)
	  #params.require(:asset).permit(:sm_content_id, asset:[])
	  params.require(:asset).permit(asset:{})
	  #params[:assets]
	  #params[:assets_attributes]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_asset
	  @asset = Asset.find(params[:id])
  end

	def sm_content_id
		params.require(:asset).permit(:sm_content_id)
	end
end
