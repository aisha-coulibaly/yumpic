class ToppagesController < ApplicationController
  def index
      @posts = Post.order(id: :desc).page(params[:page]).per(21)
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    end
  end
end
