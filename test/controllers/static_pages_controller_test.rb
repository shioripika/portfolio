require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #TOPページの表示
  test "get home" do
    get root_path
    assert_response :success
    assert_select "title", "TOP | 石原農園"
  end
  
  #農園紹介ページの表示
  test "get introduce" do
    get introduce_path
    assert_response :success
    assert_select "title", "農園紹介 | 石原農園"
  end
  
  #野菜の日常と交流ページの表示
  test "get grow" do
    get grow_path
    assert_response :success
    assert_select "title", "作っとるもん | 石原農園"
  end        
  
  #お問い合わせページの表示
  test "get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "お問い合わせ | 石原農園"
  end      
end 