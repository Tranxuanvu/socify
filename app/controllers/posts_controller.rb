class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.order(:created_at).page params[:page]
  end

  def show;end

  def edit;end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end

    if @post.save
      redirect_to root_path
    else
      flash[:aler] = @post.errors.full_messages.first
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      flash[:aler] = @post.errors.full_messages.first
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:attachment, :content)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
