class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'micropostをお気に入りリストに追加しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'micropostをお気に入りリストから削除しました。'
    redirect_back(fallback_location: root_url)
  end
end
