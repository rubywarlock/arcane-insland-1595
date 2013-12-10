class GenmenusController < ApplicationController
  def index
		@gmenus = Genmenu.all
		#@submenus = Submenu.all(params[:genmenu])

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @gmenus }
		end
  end

  def show
    @gmenu = Genmenu.find(params[:id])

    respond_to do |format|
	    format.html # show.html.erb
	    format.json { render json: @gmenu }
    end
  end

  def create
  end

  def destroy
  end

  def edit
	  @gmenu = Genmenu.find(params[:id])
  end

  def update
	  @gmenu = Post.find(params[:id])

	  respond_to do |format|
		  if @gmenu.update_attributes(params[:genmenu])
			  format.html { redirect_to @gmenu, notice: 'Post was successfully updated.' }
			  format.json { head :no_content }
		  else
			  format.html { render action: "edit" }
			  format.json { render json: @gmenu.errors, status: :unprocessable_entity }
		  end
	  end
  end

  def add
  end
end
