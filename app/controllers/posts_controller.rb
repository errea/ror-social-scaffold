class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all

    respond_to do |format|
      format.json { render json: @posts }
      format.html # index.html.erb
      format.xml { render xml: @posts }
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  # rubocop:disable Layout/LineLength
  def timeline_posts
    @timeline_posts ||= Post.all.where(user: current_user).or(Post.all.where(user: current_user.friends)).ordered_by_most_recent
  end
  # rubocop:enable Layout/LineLength

  def post_params
    params.require(:post).permit(:content)
  end
end
