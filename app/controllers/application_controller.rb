class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
   private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインして下さい。"
        redirect_to login_url
      end
    end
    
    #ログイン前でログイン後の内容を見られないか確認
    def authenticate_user
      if current_user == nil
        flash[:danger] = "ログインして下さい。"
        redirect_to login_url
      end  
    end
end
