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

	end

end
