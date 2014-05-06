require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
	before  { @user = User.new(name:"UserName", email: "user@mail.ru", password: "123456", password_confirmation: "123456") }
	subject { @user }

	it { should respond_to(:name)  }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "when user name is not present" do
		before { @user.name = "" }
		it     { should_not be_valid }
	end

	describe "when user email is not present" do
		before { @user.email = "" }
		it     { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it     { should_not be_valid }
	end

	describe "when email format not valid" do
		it "should be not valid" do
			emails = %w[sad@asd,er asd.asd.asd @asd.sd asd+asd@asd.]
			emails.each do |e|
				@user.email = e
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			emails.each do |e|
				@user.email = e
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			s = @user.dup
			s.email = @user.email.upcase
			s.save
		end

		it { should_not be_valid }

	end

	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be saved as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.reload.email).to eq mixed_case_email.downcase
		end
	end

	describe "when password is not present" do
		before { @user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ") }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before {@user.password_confirmation = "false" }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

end