class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.iine?(current_user)
      @micropost.iine(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end    
    end
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    if @micropost.iine?(current_user)
      @micropost.not_iine(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
