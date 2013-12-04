require 'spec_helper'

describe StaticPagesController do

  describe "GET 'Home'" do
    it "returns http success" do
      get 'Home'
      response.should be_success
    end
  end

  describe "GET 'About'" do
    it "returns http success" do
      get 'About'
      response.should be_success
    end
  end

  describe "GET 'Contact'" do
    it "returns http success" do
      get 'Contact'
      response.should be_success
    end
  end

end
