class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :check_if_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
      render :new
  end

  def show
    @sub = Sub.find(params[:id])
    @sub.posts.includes(:title)
    render :show
  end

  def create
    s = Sub.new(sub_params)
    s.moderator = current_user
    if s.save
      redirect_to sub_url(s)
    else
      flash.now[:errors] = s.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
      render :edit
  end

  def update
    s = Sub.find(params[:id])
    if s.update(sub_params)
      redirect_to sub_url(s)
    else
      flash[:errors] = s.errors.full_messages
      redirect_to edit_sub_url(s)
    end
  end

  def check_if_moderator
    unless current_user == Sub.find(params[:id]).moderator
      flash[:errors] = "you must be the mod"
      redirect_to sub_url(params[:id])
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:description, :title)
  end
end
