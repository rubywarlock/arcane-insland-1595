require 'spec_helper'

describe "Authentication;" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_title('Sign in') }
			it { should have_selector('div.alert.alert-error') }
		end


		describe "with valid information;" do
			#let(:user) { FactoryGirl.create(:user) }
			let(:user) { User.create(name: "Name", password: "123456", password_confirmation: "123456", email: 'admin2@railstutorial.org') }
			#let(:user) { User.find_by(email: 'admin2@railstutorial.org') }
			before do
				fill_in "Email",    with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it { should have_title(user.name) }
			#it { should have_link('Profile',     href: user_path(user)) }
			it { should have_link('Sign out',    href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }

			it { should have_link("Settings", href: user_settings_path(:user_id => user)) }

			describe "vitis settings page" do
				it { visit user_settings_path(:user_id => user) }
			end
		end


	end
end