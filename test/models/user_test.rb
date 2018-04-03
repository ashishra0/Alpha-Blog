require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: "Ashish", email: "ashishrao2598@gmail.com", password: "password")
    end

    test "user should have a name" do
        assert @user.valid?
    end

    test "user must be unique" do
        @user.save
        @user = User.new(username: "Ram", email: "ram@exmaple.com", password: "password")
        assert @user.valid?
    end

end