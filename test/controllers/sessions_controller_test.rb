require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
    #ログインページの表示
  test "should sessions new" do
    get login_path
    assert_response :success
    assert_select "a[href=?]", signup_path
  end
end
