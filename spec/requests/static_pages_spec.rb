require 'spec_helper'

#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end


describe "Static pages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content('TEST APP') }
		it { should have_title('Page name') }
		it { should_not have_title('| Home') }
	end

end