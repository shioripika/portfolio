require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  #リンクがそれぞれのページに変移できるか
  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", introduce_path
    assert_select "a[href=?]", grow_path
    assert_select "a[href=?]", contact_path
    
  end
  
end
