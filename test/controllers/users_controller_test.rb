require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  #新規登録ページの表示
  test "get new" do
    get signup_path
    assert_response :success
    assert_select  "title", "新規登録 | 石原農園"
  end
end    