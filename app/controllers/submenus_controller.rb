class SubmenusController < ApplicationController
	def index
		@smenus = Submenu.all

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

  def create
  end

  def destroy
  end

  def edit
	  @smenu = Submenu.find(params[:id])
  end

	def update
		@smenu = Comment.find(params[:id])
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
end
