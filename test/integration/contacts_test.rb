require 'test_helper'

class ContactsTest < ActionDispatch::IntegrationTest
  #contactページが失敗するテスト
  test "invalid contact" do
    get contact_path
    post contacts_path, params: {contact: {name: " ", email: " ", message: " "}}
    assert_template "contacts/new"
    assert_select "div#error_explanation"
    assert_select "div.alert-danger"
    assert_select 'form[action="/contacts"]'
  end
  
  #contactページが成功するテスト
  test "valid contact" do
    get contact_path
    post contacts_path, params: {contact: {name: "aaaaa", email: "aaa@example.com", message: "aaaaaaaaaaaaaaa"}}
    follow_redirect!
    assert_template "static_pages/home"
    assert_not flash.empty?
  end    
end