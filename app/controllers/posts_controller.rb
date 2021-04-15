class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(20)
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
      @favorite_count = Favorite.where(post_id: @post.id).count
    end
  end

  def show
    @posts = Post.all
    @post = Post.find_by(id: params[:id])
    @favorite_count = Favorite.where(post_id: @post.id).count
  end

  
  def new
    @post = Post.new
  end
  
  def create
  @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '写真を投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '写真の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '写真を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  
  
  private
  def post_params
    params.require(:post).permit(:image, :tag_list, :url)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
  
end
