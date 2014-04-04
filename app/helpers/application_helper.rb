module ApplicationHelper
	def full_title(page_title)
		base_title = "Page name"
		#base_title.to_s.force_encoding("UTF-8")
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def get_route
		path = Rails.application.routes.recognize_path(request.env['PATH_INFO'])

		controller = path[:controller]
		action = path[:action]
		controller
		#Rails::ActiveRecord.
	end

	def get_assets(content)
		@assets = Asset.where(:sm_content_id => content)
	end

	def mainmenubuild(main_menu_items)
		row_html_start = '<div class="row"><div class="menu-block"><ul class="nav-list my-sub-menu">'
		row_html_end   = '</ul></div></div>'
		row_html = ''

		menu_html_ready = ''
		menu_html = ''

		mm_text_html = ''
		main_menu_items.each_with_index do |mmenu, n|

			mm_text_html = mm_text_html + '<li class="nav-header my-gen-menu-name">' + mmenu.genmenuname + '</li>'
			sm_text_html = ''
			mmenu.submenus.each do |smenu|
				sm_text_html = sm_text_html + '<li><a href="#">' + smenu.sname + '</a></li>'
			end
			mm_text_html = mm_text_html + '<li class="divider my-gen-menu-name"></li><li>Help</li>'

			
			if n == 2
				menu_html = '<div class="row"><div class="menu-block"><ul class="nav-list my-sub-menu">'
				mm_text_html = mm_text_html + sm_text_html + '<li class="divider my-gen-menu-name"></li><li>Help</li></ul></div></div>'
			else

			end

			#mm_text_html = mm_text_html + sm_text_html
			menu_html_ready = menu_html_ready + menu_html
		end

		row_html = row_html + mm_text_html + '<li class="divider my-gen-menu-name"></li><li>Help</li></ul></div></div>'
		row_html.html_safe
	end

end
