require 'test_helper'

class DeviseLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @current_user = users(:testing_user)
  end

  test "redirected to login" do
    get courses_url
    assert_redirected_to "/users/sign_in"
  end

  test "successful login and redirect" do
    sign_in @current_user
    get courses_url
    assert_response :success
  end
end
