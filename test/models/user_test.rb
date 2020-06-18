require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")  
  end 
  #ユーザーが有効かどうか
  test "should be valid" do
    assert @user.valid?  
  end
  
  #名前が空白のものは無効
  test "name should be present" do
    @user.name = "  " 
    assert_not @user.valid?
  end
  
  #メールアドレスが空白のものは無効
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
  
  #名前が31文字以上は無効
  test "name should be too long" do
    @user.name = "a"*31
    assert_not @user.valid?
  end
  
  #メールアドレスが255文字以上は無効
  test "email should be too long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end
  
  #メールアドレスが正規表現できてないものは無効
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  #メールアドレスが一意性じゃないものは無効
  test "email should be uniqueness" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  #メールアドレスが大文字が含んでたら小文字で保存されるテスト
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  #パスワードが空白なら無効
  test "password should be blank" do
    @user.password = @user.password_confirmation = " "*6
    assert_not @user.valid?
  end
  
  #パスワードが5文字以下は無効（6文字から）
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5 
    assert_not @user.valid?
  end
end