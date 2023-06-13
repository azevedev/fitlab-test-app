require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
  end

  test 'should be able to register' do
    assert_difference('User.count') do
      post '/users', params: { user: { email: 'abc@gmail.com', password: 'very-secret', password_confirmation: 'very-secret' } }
    end
    assert_redirected_to root_url
  end

  test 'should be able to login' do
    post user_session_url, params: { user: { email: @user.email, password: 'password' } }
    assert_redirected_to root_url
  end

  test 'should be able to logout' do
    delete destroy_user_session_url
    assert_redirected_to root_url
  end
end
