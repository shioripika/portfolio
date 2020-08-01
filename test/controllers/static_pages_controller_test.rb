require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #TOPページの表示
  test "get home" do
    get root_path
    assert_response :success
    assert_select "title", "TOP | 石原農園"
  end
  
  
end 