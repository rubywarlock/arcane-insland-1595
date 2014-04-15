require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
	before  { @user = User.new(name:"UserName", email: "user@mail.ru") }
	subject { @user }

	it { should respond_to(:name)  }
	it { should respond_to(:email) }

	describe "when user name is not present" do
		before { @user.name = "" }
		it     { should_not be_valid }
	end

end