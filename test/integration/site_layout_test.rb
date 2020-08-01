require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  #リンクがそれぞれのページに変移できるか
  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    
    
  end
  
end
