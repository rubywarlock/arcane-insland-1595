module SubmenusHelper
	def get_active_submenu(smenu_id)
		submenu_id = params[:id]
		mclass = ''
		if params[:controller] == 'submenus'
			if submenu_id.to_i == smenu_id.to_i
				mclass = 'active'
			end
		end
		mclass
	end
end