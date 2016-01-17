require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new( email: "user@example.com", password: "foobar", password_confirmation: "foobar", acceptance: true)
  end

  test "authenticated? should return false for a user with a nil digest" do
    assert_not @user.authenticated?(:remember,'')
  end

end
