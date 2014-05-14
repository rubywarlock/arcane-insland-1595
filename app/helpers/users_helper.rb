module UsersHelper
	def full_title(page_title)
		base_title = "Page name"
		#base_title.to_s.force_encoding("UTF-8")
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end