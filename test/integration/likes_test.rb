require 'test_helper'

class LikesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @micropost = microposts(:ants)
    
  end

  #いいね！をしたらカウントの数字が増えるテスト    
  test "should iine with Ajax" do
    log_in_as(@user)
    assert_difference '@micropost.likes.count', 1 do
      post likes_path, xhr: true, params: { micropost_id: @micropost.id}
    end
  end
  
  #いいね！をしたらカウントの数字が減るテスト
  test "should not_iine with Ajax" do
    log_in_as(@user)
    post likes_path, xhr: true, params: { micropost_id: @micropost.id}
    micropost = @user.likes.find_by(micropost_id: @micropost.id)
    assert_difference '@micropost.likes.count', -1 do
      delete like_path(micropost), xhr: true
    end
  end
end