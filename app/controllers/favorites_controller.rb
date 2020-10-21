class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:favorite_id])
    current_user.favor(micropost)
    flash[:success] = "お気に入り登録をしました"
    redirect_back(fallback_location: likes_user_path(current_user))
  end

  def destroy
    micropost = Micropost.find(params[:favorite_id])
    current_user.unfavor(micropost)
    flash[:success] = "お気に入り登録を解除しました"
    redirect_back(fallback_location: likes_user_path(current_user))
  end
end
