require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #rootで呼び出した時の表示
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "TOP | 石原農園"
  end
  
  #TOPページの表示  
  test "get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "TOP | 石原農園"
  end
  
  #農園紹介ページの表示
  test "get introduce" do
    get static_pages_introduce_url 
    assert_response :success
    assert_select "title", "農園紹介 | 石原農園"
  end
  
  #野菜の日常と交流ページの表示
  test "get grow" do
    get static_pages_grow_url
    assert_response :success
    assert_select "title", "作っとるもん | 石原農園"
  end        
  
  #お問い合わせページの表示
  test "get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "お問い合わせ | 石原農園"
  end      
end 