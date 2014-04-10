class DownloadController < ApplicationController
  def zip
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "application/zip", :x_sendfile => true
  end

  def pdf
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "application/pdf", :x_sendfile => true
  end

  def doc
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "application/doc", :x_sendfile => true
  end

  def txt
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "text/plain", :x_sendfile => true
  end

  def xls
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "application/xls", :x_sendfile => true
  end

  def jpg
	  @asset = Asset.find(params[:asset_id])
	  send_file Rails.root.join('private', @asset.asset.path), :type => "application/jpg", :x_sendfile => true
  end
end
