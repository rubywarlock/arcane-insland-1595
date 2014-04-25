require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
	before  { @user = User.new(name:"UserName", email: "user@mail.ru") }
	subject { @user }

	it { should respond_to(:name)  }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }

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

end