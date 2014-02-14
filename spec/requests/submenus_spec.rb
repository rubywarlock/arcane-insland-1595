require 'spec_helper'

describe "Submenus" do
	subject { page }

  describe "GET /submenus" do

	  before { visit "/submenus/1" }
	  it { should have_content('START') }
  end
end