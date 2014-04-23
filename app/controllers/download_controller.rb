class DownloadController < ApplicationController

	def file
		@asset = Asset.find(params[:asset_id])
		send_file Rails.root.join('private', @asset.asset.path), :type => @asset.asset_content_type, :x_sendfile => true
	end

end
