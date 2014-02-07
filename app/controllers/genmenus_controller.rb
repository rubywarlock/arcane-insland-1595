class GenmenusController < ApplicationController
	before_action :set_mmenu, :new_main_menu, only: [:show, :edit, :update, :destroy]

  def index
		@gmenus = Genmenu.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @gmenus }
		end
  end

  def show
    @gmenu = Genmenu.find(params[:id])
    @submenus = Submenu.new(get_gmenu_id)

    respond_to do |format|
	    format.html # show.html.erb
	    format.json { render json: @gmenu }
    end
  end

  def new
	  @gmenu = Genmenu.new

	  respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @gmenu }
	  end
  end

  def create
	  @gmenu = Genmenu.new(main_menu_params)
	  if @gmenu.save
		  flash[:success] = "Main menu created!"
		  redirect_to genmenus_path
	  else
		  render 'static_pages/home'
	  end
  end

  def destroy
  end

  def edit
	  @gmenu = Genmenu.find(params[:id])
  end

  def update
	  @gmenu = Genmenu.find(params[:id])

	  respond_to do |format|
		  if @gmenu.update_attributes(params[:genmenu])
			  format.html { redirect_to @gmenu, notice: 'Genmenu was successfully updated.' }
			  format.json { head :no_content }
		  else
			  format.html { render action: "edit" }
			  format.json { render json: @gmenu.errors, status: :unprocessable_entity }
		  end
	  end
  end

  def submenuadd
	  @gmenu = Genmenu.find(params[:id])
	  @submenu = @gmenu.submenus.build(get_submenu)
	  if @submenu.save
		  @submenu = Submenu.new
	  end
	  render :action => :show
  end


  private

	def new_main_menu
		@new_main_menu = Genmenu.new
	end

	def set_mmenu
		@gmenu = Genmenu.find(params[:id])
	end

	def get_submenu
		params.require(:submenus).permit(:sname)
	end

	def get_gmenu_id
		params.permit(:id)
	end

  def main_menu_params
	  params.require(:genmenu).permit(:genmenuname)
  end
end
