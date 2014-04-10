require 'spec_helper'

describe DownloadController do

  describe "GET 'zip'" do
    it "returns http success" do
      get 'zip'
      response.should be_success
    end
  end

  describe "GET 'pdf'" do
    it "returns http success" do
      get 'pdf'
      response.should be_success
    end
  end

  describe "GET 'doc'" do
    it "returns http success" do
      get 'doc'
      response.should be_success
    end
  end

  describe "GET 'xls'" do
    it "returns http success" do
      get 'xls'
      response.should be_success
    end
  end

  describe "GET 'jpg'" do
    it "returns http success" do
      get 'jpg'
      response.should be_success
    end
  end

end
