class ToppagesController < ApplicationController
  def index
      @posts = Post.all
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    end
  end
end
