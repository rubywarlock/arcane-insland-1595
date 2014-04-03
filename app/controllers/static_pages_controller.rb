class StaticPagesController < ApplicationController

	add_breadcrumb "home", :root_path
	#add_breadcrumb "submenus", submenus_path
	#add_breadcrumb "content", sm_contents_path

  def home
	  #@genmenusall = Genmenu.all
  end

  def about
	  #@genmenusall = Genmenu.all
  end

  def contact
	  #@genmenusall = Genmenu.all
  end

  def help
	  #@genmenusall = Genmenu.all
  end

	def cnm
		#@genmenusall = Genmenu.all
		add_breadcrumb "admin tools", admintools_path
	end
end
