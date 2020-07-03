require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end
  
  #マイクロポストは有効かどうかのテスト
  test "should be valid" do
    assert @micropost.valid?
  end
  
  #user_idが存在しているのかどうかのテスト
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  #contentが存在しているかどうかのテスト
  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end
  
  #contentが１４０文字以内かどうかのテスト
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  #マイクロポストを順序付けするテスト
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end