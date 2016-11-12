class PostsController < ApplicationController
  before_action :check_if_author, only: [:edit, :update, :destroy]
  before_action :require_logged_in

  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find(params[:id])
    @post.comments.includes(:content, :parent_comment_id)
    @all_comments = @post.comments_by_parent_id
    render :show
  end

  def create
    post = Post.new(post_params)
    post.author = current_user
    if post.save
      redirect_to post_url(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to sub_url(post.sub)
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_url(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to post_url(post)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to sub_url(post.subs.last)
  end

  private

  def check_if_author
    unless current_user == Post.find(params[:id]).author
      flash[:errors] = "You must be the author, "
      redirect_to post_url(params[:id])
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
