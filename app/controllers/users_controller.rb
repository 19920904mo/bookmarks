class UsersController < ApplicationController
  
  def index
    @user = Post.where(user_id: current_user.id).order(created_at: "DESC").page(params[:page]).per(5)
    @nickname = current_user.nickname
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
end
