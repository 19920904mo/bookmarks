class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: "DESC").page(params[:page]).per(5)
  end
  
  def  show
    @post = Post.find_by(id: params[:id])
    if current_user
      @nickname = current_user.nickname
      @user_id = current_user.id
    end
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content],title: params[:title],url: params[:url],image: params[:image],user_id: current_user.id)
    @post.save
      redirect_to("/posts/index")
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "completed"
      redirect_to("/users/#{@post.id}")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/users/#{@post.id}")
  end
  
  def message
  end
  
  
  
end
